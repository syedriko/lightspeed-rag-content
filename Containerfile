ARG EMBEDDING_MODEL=sentence-transformers/all-mpnet-base-v2
ARG FLAVOR=cpu
ARG HERMETIC=false

FROM registry.redhat.io/rhai-early-access/base-image-cpu-rhel9:3.3 as cpu-base
ARG EMBEDDING_MODEL
ARG FLAVOR

FROM registry.redhat.io/rhai/base-image-cuda-12.9-rhel9:3.3 as gpu-base
ARG EMBEDDING_MODEL
ARG FLAVOR

FROM ${FLAVOR}-base as lightspeed-rag-builder
ARG EMBEDDING_MODEL
ARG FLAVOR
ARG HERMETIC

USER 0
WORKDIR /workdir

# Konflux hermetic: Cachi2 vendor layout (PIP_FIND_LINKS) + hashed split lockfiles
COPY \
    requirements.hashes.wheel.cpu.txt \
    requirements.hashes.wheel.gpu.txt \
    requirements.hashes.source.cpu.txt \
    requirements.hashes.source.gpu.txt \
    requirements-build.cpu.txt \
    requirements-build.gpu.txt \
    requirements.hermetic.txt \
    pyproject.toml \
    LICENSE \
    /workdir/

# Install torch (optional extra) and other deps: same pattern as openshift/lightspeed-service
RUN if [ -f /cachi2/cachi2.env ]; then \
        . /cachi2/cachi2.env && \
        pip3.12 install --no-cache-dir --no-index --find-links "${PIP_FIND_LINKS}" --no-deps \
            -r "requirements.hashes.wheel.${FLAVOR}.txt" \
            -r "requirements.hashes.source.${FLAVOR}.txt" \
    ; else \
        pip3.12 install --no-cache-dir "pip>=25" && \
        pip3.12 install --no-cache-dir -e ".[${FLAVOR}]" \
    ; fi
RUN ln -s "/usr/local/lib/python3.12/site-packages/llama_index/core/_static/nltk_cache" /root/nltk_data

COPY ocp-product-docs-plaintext ./ocp-product-docs-plaintext
COPY runbooks ./runbooks

COPY embeddings_model ./embeddings_model
RUN cd embeddings_model; if [ "$HERMETIC" == "true" ]; then \
        cp /cachi2/output/deps/generic/model.safetensors model.safetensors; \
    else \
        curl -L -O https://huggingface.co/sentence-transformers/all-mpnet-base-v2/resolve/9a3225965996d404b775526de6dbfe85d3368642/model.safetensors; \
    fi

RUN if [ "$FLAVOR" == "gpu" ]; then \
        export LD_LIBRARY_PATH=/usr/local/cuda-12/compat:$LD_LIBRARY_PATH; \
        python3.12 -c "import torch; print(torch.version.cuda); print(torch.cuda.is_available());"; \
    fi

COPY scripts/generate_embeddings.py .
RUN export LD_LIBRARY_PATH=/usr/local/cuda-12/compat:$LD_LIBRARY_PATH; \
    set -e && for OCP_VERSION in $(ls -1 ocp-product-docs-plaintext); do \
        python3.12 generate_embeddings.py -f ocp-product-docs-plaintext/${OCP_VERSION} -r runbooks/alerts -md embeddings_model \
            -mn ${EMBEDDING_MODEL} -o vector_db/ocp_product_docs/${OCP_VERSION} \
            -i ocp-product-docs-$(echo $OCP_VERSION | sed 's/\./_/g') -v ${OCP_VERSION} -hb $HERMETIC; \
    done
RUN LATEST_VERSION=$(ls -1 vector_db/ocp_product_docs/ | sort -V | tail -n 1) && \
    cd vector_db/ocp_product_docs && ln -s ${LATEST_VERSION} latest

FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:7d4e47500f28ac3a2bff06c25eff9127ff21048538ae03ce240d57cf756acd00
COPY --from=lightspeed-rag-builder /workdir/vector_db/ocp_product_docs /rag/vector_db/ocp_product_docs
COPY --from=lightspeed-rag-builder /workdir/embeddings_model /rag/embeddings_model

# this directory is checked by ecosystem-cert-preflight-checks task in Konflux
RUN mkdir /licenses
COPY LICENSE /licenses/

# Labels for enterprise contract
LABEL com.redhat.component=openshift-lightspeed-rag-content
LABEL cpe="cpe:/a:redhat:openshift_lightspeed:1::el9"
LABEL description="Red Hat OpenShift Lightspeed RAG content"
LABEL distribution-scope=private
LABEL io.k8s.description="Red Hat OpenShift Lightspeed RAG content"
LABEL io.k8s.display-name="Openshift Lightspeed RAG content"
LABEL io.openshift.tags="openshift,lightspeed,ai,assistant,rag"
LABEL name="openshift-lightspeed/lightspeed-rag-content-rhel9"
LABEL release=0.0.1
LABEL url="https://github.com/openshift/lightspeed-rag-content"
LABEL vendor="Red Hat, Inc."
LABEL version=0.0.1
LABEL summary="Red Hat OpenShift Lightspeed RAG content"
LABEL konflux.additional-tags="latest"

USER 65532:65532
