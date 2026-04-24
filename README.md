# OpenShift Lighspeed RAG content

## `requirements*` files (Konflux / Cachi2)

Lockfiles are generated from `pyproject.toml` using the same `uv` + split-index
approach as [openshift/lightspeed-service](https://github.com/openshift/lightspeed-service) (`scripts/konflux_requirements.sh` there).

For each build flavor (CPU vs GPU), run:

```bash
./scripts/konflux_requirements.sh cpu
./scripts/konflux_requirements.sh gpu
```

This updates `requirements.hashes.source.<flavor>.txt`, `requirements.hashes.wheel.<flavor>.txt`,
`requirements-build.<flavor>.txt`, and `requirements.hermetic.txt`. If the set of
binary wheels changes, also sync the `pip.binary.packages` value inside the
corresponding Konflux `prefetch-input` params. After `./scripts/konflux_requirements.sh cpu|gpu`,
the script updates `pip.binary.packages` in both `.tekton/*` and `.konflux/*` PipelineRuns when
those files exist and contain a matching one-line `"packages": "..."` entry (same approach as
`openshift/lightspeed-service`). If you use multiline `prefetch-input` JSON, sync `packages` by hand.

The BYO Knowledge tool image is built from `byok/Containerfile.tool` (CPU-only); it installs
from the same `requirements.hashes.*.cpu.txt` / `requirements-build.cpu.txt` files as the
lightspeed-rag-tool Konflux component.

## RPM lock (`rpms.lock.yaml`)

Konflux prefetches RPMs using `rpms.in.yaml` and a generated `rpms.lock.yaml`. Regenerate the
lock with `scripts/generate-rpm-lock.sh` (same flow as `openshift/lightspeed-service`, adapted for
this repo’s `contentOrigin.repofiles`: `ubi.repo` and `cuda.repo` instead of `redhat.repo`).

```bash
./scripts/generate-rpm-lock.sh -a '<activation-key>' -g '<org-id>'
```

Optional: `-f` / `-O` for non-default paths, `-i` to override the `--image` passed to
`rpm-lockfile-prototype` (default matches the Python 3.12 UBI image). Optional `build.args` at the
repo root with `BUILDER_BASE_IMAGE=...` overrides that default, like the service repo.

Set `REGISTRY_USERNAME` / `REGISTRY_PASSWORD` if the base image registry requires `skopeo login`.
