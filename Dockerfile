# Inherit from an upstream image
FROM pangeo/pytorch-notebook:2024.06.02

USER root

RUN apt-get update -qq --yes > /dev/null && \
    apt-get install --yes -qq \
        git \
        vim \
        tree \
        groff > /dev/null

USER ${NB_USER}

# Install packages
COPY environment.yml /tmp/
RUN mamba env update -p ${CONDA_DIR} -f /tmp/environment.yml && mamba clean -afy

CMD ["bash"]
