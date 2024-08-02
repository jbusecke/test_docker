# Inherit from an upstream image
FROM pangeo/pytorch-notebook:2024.07.30

# Install git and clone repository
RUN git clone https://github.com/leap-stc/ChaosBench.git

# Install packages
COPY environment.yml /tmp/environment.yml
RUN mamba env update --prefix ${CONDA_DIR} --file /tmp/environment.yml

RUN ls

RUN echo "conda activate base" >> ~/.bashrc
CMD ["bash"]
