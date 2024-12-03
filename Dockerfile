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
RUN mamba env update --prefix ${NB_PYTHON_PREFIX} --file /tmp/environment.yml && mamba clean -afy
CMD ["bash"]
