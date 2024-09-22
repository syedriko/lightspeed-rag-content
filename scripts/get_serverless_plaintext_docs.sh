#!/bin/bash
set -eou pipefail

SERVERLESS_VERSION=$1
SERVERLESS_DOCS_DIR=serverless-docs

trap "rm -rf ${SERVERLESS_DOCS_DIR}" EXIT

rm -rf serverless-docs-plaintext/${SERVERLESS_VERSION}

git clone --single-branch --branch serverless-docs-${SERVERLESS_VERSION} https://github.com/openshift/openshift-docs.git ${SERVERLESS_DOCS_DIR}

python scripts/asciidoctor-text/convert-it-all.py -i ${SERVERLESS_DOCS_DIR} -t serverless-docs/_topic_maps/_topic_map.yml \
    -d openshift-serverless -o serverless-docs-plaintext/${SERVERLESS_VERSION} -a scripts/asciidoctor-text/serverless/${SERVERLESS_VERSION}/attributes.yaml
