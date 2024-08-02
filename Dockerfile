# Inherit from an upstream image
FROM pangeo/pytorch-notebook:2024.06.02

# Install packages
COPY environment.yml /tmp/environment.yml
RUN mamba env update --prefix ${CONDA_DIR} --file /tmp/environment.yml
RUN pip install zarr

CMD ["bash"]
