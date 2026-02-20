ARG BASE_IMAGE=quay.io/jupyter/minimal-notebook:2026-02-19
FROM $BASE_IMAGE

USER ${NB_UID}

COPY --chown=${NB_UID}:${NB_GID} environment.yaml /tmp/environment.yaml
RUN mamba env update --name base --file /tmp/environment.yaml && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"