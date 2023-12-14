# Inherit from an upstream image
FROM pangeo/pangeo-notebook:2023.11.14

COPY environment.yml /tmp/environment.yml
RUN mamba env update --prefix ${CONDA_DIR} --file /tmp/environment.yml

RUN ls
