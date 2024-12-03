# Inherit from an upstream image
FROM pangeo/pangeo-notebook:2024.10.01

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
COPY requirements.txt /tmp/requirements.txt
RUN mamba env update -p ${CONDA_DIR} -f /tmp/environment.yml && mamba clean -afy

CMD ["bash"]
