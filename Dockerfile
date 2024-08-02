# Inherit from an upstream image
FROM pangeo/pytorch-notebook:2024.06.02

# Install packages
COPY environment.yml /tmp/environment.yml
RUN mamba env update --name notebook --file /tmp/environment.yml

CMD ["bash"]
