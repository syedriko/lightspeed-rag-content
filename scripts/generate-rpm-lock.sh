#!/bin/bash
#
# Regenerate rpms.lock.yaml from rpms.in.yaml using rpm-lockfile-prototype (Konflux).
# Adapted from openshift/lightspeed-service/scripts/generate-rpm-lock.sh; this repo uses
# contentOrigin.repofiles (e.g. ubi.repo + cuda.repo) instead of a single redhat.repo.

set -e

# Image whose DNF stack and repos rpm-lockfile-prototype resolves against (match Containerfile / Konflux)
DEFAULT_BASE_IMAGE="registry.access.redhat.com/ubi9/python-312:1"
BUILD_ARGS_FILE="build.args"
INPUT_FILE="rpms.in.yaml"
OUTPUT_FILE="rpms.lock.yaml"
CONTAINER_IMAGE="registry.access.redhat.com/ubi9/ubi:latest"

if ! command -v podman &>/dev/null; then
	echo "Error: podman is required but was not found in PATH." >&2
	exit 1
fi
CONTAINER_RUNTIME="podman"

if [[ -f "$BUILD_ARGS_FILE" ]]; then
	EXTRACTED_BASE_IMAGE=$(grep "^BUILDER_BASE_IMAGE=" "$BUILD_ARGS_FILE" | cut -d'=' -f2- || true)
	if [[ -n "$EXTRACTED_BASE_IMAGE" ]]; then
		BASE_IMAGE="$EXTRACTED_BASE_IMAGE"
		echo "Using base image from $BUILD_ARGS_FILE: $BASE_IMAGE"
	else
		BASE_IMAGE="$DEFAULT_BASE_IMAGE"
		echo "BUILDER_BASE_IMAGE not found in $BUILD_ARGS_FILE, using default: $BASE_IMAGE"
	fi
else
	BASE_IMAGE="$DEFAULT_BASE_IMAGE"
	echo "$BUILD_ARGS_FILE not found, using default base image: $BASE_IMAGE"
fi

usage() {
	echo "Usage: $0 -a ACTIVATION_KEY -g ORG_ID [-i BASE_IMAGE] [-f INPUT_FILE] [-O OUTPUT_FILE]" >&2
	echo "" >&2
	echo "Required:" >&2
	echo "  -a ACTIVATION_KEY  Red Hat activation key for subscription-manager" >&2
	echo "  -g ORG_ID          Red Hat organization ID for subscription-manager" >&2
	echo "" >&2
	echo "Options:" >&2
	echo "  -i BASE_IMAGE      Base image for rpm-lockfile-prototype --image (default: $BASE_IMAGE)" >&2
	echo "  -f INPUT_FILE      Input RPM spec (default: $INPUT_FILE)" >&2
	echo "  -O OUTPUT_FILE     Output lock file (default: $OUTPUT_FILE)" >&2
	echo "  -h                 Show this help message" >&2
	echo "" >&2
	echo "Environment variables:" >&2
	echo "  REGISTRY_USERNAME   For skopeo login to pull BASE_IMAGE if needed" >&2
	echo "  REGISTRY_PASSWORD" >&2
	exit 1
}

ACTIVATION_KEY=""
ORG_ID=""

while getopts "a:g:i:f:O:h" opt; do
	case $opt in
	a) ACTIVATION_KEY="$OPTARG" ;;
	g) ORG_ID="$OPTARG" ;;
	i) BASE_IMAGE="$OPTARG" ;;
	f) INPUT_FILE="$OPTARG" ;;
	O) OUTPUT_FILE="$OPTARG" ;;
	h) usage ;;
	*) usage ;;
	esac
done

if [[ -z "$ACTIVATION_KEY" || -z "$ORG_ID" ]]; then
	echo "Error: Both activation key (-a) and organization ID (-g) are required." >&2
	usage
fi

if [[ ! -f "$INPUT_FILE" ]]; then
	echo "Error: Input file '$INPUT_FILE' not found." >&2
	exit 1
fi

INPUT_DIR=$(cd "$(dirname "$INPUT_FILE")" && pwd)
INPUT_BASE=$(basename "$INPUT_FILE")
INPUT_FILE="$INPUT_DIR/$INPUT_BASE"
OUT_DIR=$(cd "$(dirname "$OUTPUT_FILE")" && pwd)
OUT_BASE=$(basename "$OUTPUT_FILE")
OUTPUT_FILE="$OUT_DIR/$OUT_BASE"

# Paths listed under contentOrigin.repofiles in rpms.in.yaml (strip quotes and ./), resolved under INPUT_DIR
list_repofiles() {
	local inner
	if ! inner=$(grep -E '^[[:space:]]*repofiles:' "$INPUT_FILE" | head -1 | sed -E 's/^[[:space:]]*repofiles:[[:space:]]*\[(.*)\].*/\1/'); then
		echo "Error: could not find repofiles: [...] in $INPUT_FILE" >&2
		exit 1
	fi
	local IFS=,
	local _bit
	for _bit in $inner; do
		_bit="${_bit//\"/}"
		_bit="${_bit//\'/}"
		_bit="${_bit#"${_bit%%[![:space:]]*}"}"
		_bit="${_bit%"${_bit##*[![:space:]]}"}"
		_bit="${_bit#./}"
		[[ -n "$_bit" ]] && printf '%s\n' "$INPUT_DIR/$_bit"
	done
}

REPOFILES=()
while IFS= read -r rf; do
	REPOFILES+=("$rf")
done < <(list_repofiles)

if [[ ${#REPOFILES[@]} -eq 0 ]]; then
	echo "Error: no repofiles parsed from $INPUT_FILE" >&2
	exit 1
fi

for rf in "${REPOFILES[@]}"; do
	if [[ ! -f "$rf" ]]; then
		echo "Error: repofile '$rf' (from $INPUT_FILE) not found." >&2
		exit 1
	fi
done

echo "Using BASE_IMAGE: $BASE_IMAGE"
echo "Using INPUT_FILE: $INPUT_FILE"
echo "Using OUTPUT_FILE: $OUTPUT_FILE"
echo "Using CONTAINER_IMAGE: $CONTAINER_IMAGE"
echo "Using CONTAINER_RUNTIME: $CONTAINER_RUNTIME"
echo "Using repofiles: ${REPOFILES[*]}"

CONTAINER_NAME="rpm-lockfile-generator-$$"
WORKDIR="/workdir"

cleanup() {
	echo "Cleaning up container..."
	$CONTAINER_RUNTIME rm -f "$CONTAINER_NAME" 2>/dev/null || true
}
trap cleanup EXIT

echo "Starting container..."
$CONTAINER_RUNTIME run -d --name "$CONTAINER_NAME" "$CONTAINER_IMAGE" sleep infinity

echo "Registering system with subscription-manager..."
$CONTAINER_RUNTIME exec "$CONTAINER_NAME" subscription-manager register \
	--activationkey="$ACTIVATION_KEY" \
	--org="$ORG_ID"

echo "Installing packages..."
$CONTAINER_RUNTIME exec "$CONTAINER_NAME" dnf install -y skopeo git make python3-pip

if [[ -n "${REGISTRY_USERNAME:-}" && -n "${REGISTRY_PASSWORD:-}" ]]; then
	echo "Logging into registry with skopeo..."
	REGISTRY_HOST=$(echo "$BASE_IMAGE" | cut -d'/' -f1)
	$CONTAINER_RUNTIME exec "$CONTAINER_NAME" skopeo login "$REGISTRY_HOST" \
		--username "$REGISTRY_USERNAME" \
		--password "$REGISTRY_PASSWORD"
fi

echo "Installing rpm-lockfile-prototype..."
$CONTAINER_RUNTIME exec "$CONTAINER_NAME" python3 -m pip install --user \
	https://github.com/konflux-ci/rpm-lockfile-prototype/archive/refs/tags/v0.21.0.tar.gz

echo "Creating workdir and copying files..."
$CONTAINER_RUNTIME exec "$CONTAINER_NAME" mkdir -p "$WORKDIR"
$CONTAINER_RUNTIME cp "$INPUT_FILE" "$CONTAINER_NAME:$WORKDIR/$INPUT_BASE"
for rf in "${REPOFILES[@]}"; do
	$CONTAINER_RUNTIME cp "$rf" "$CONTAINER_NAME:$WORKDIR/$(basename "$rf")"
done

echo "Running rpm-lockfile-prototype..."
$CONTAINER_RUNTIME exec -w "$WORKDIR" "$CONTAINER_NAME" bash -c '
	DNF_VAR_SSL_CLIENT_KEY=$(find /etc/pki/entitlement -type f -name "*key.pem" | head -1)
	export DNF_VAR_SSL_CLIENT_KEY
	DNF_VAR_SSL_CLIENT_CERT="${DNF_VAR_SSL_CLIENT_KEY//-key/}"
	export DNF_VAR_SSL_CLIENT_CERT
	/root/.local/bin/rpm-lockfile-prototype \
		--image "'"$BASE_IMAGE"'" \
		--outfile "'"$OUT_BASE"'" \
		"'"$INPUT_BASE"'"
'

echo "Copying output file from container..."
mkdir -p "$OUT_DIR"
$CONTAINER_RUNTIME cp "$CONTAINER_NAME:$WORKDIR/$OUT_BASE" "$OUTPUT_FILE"

echo "Successfully generated $OUTPUT_FILE"
