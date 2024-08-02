# Inherit from an upstream image
FROM pangeo/pytorch-notebook:2024.06.02

# Install git and clone repository
RUN git clone https://github.com/leap-stc/ChaosBench.git

# Install packages
COPY environment.yml /tmp/environment.yml
RUN mamba env update --prefix ${CONDA_DIR} --file /tmp/environment.yml

# Register the base environment as the default kernel
RUN conda run -n base pip install ipykernel
RUN conda run -n base python -m ipykernel install --user --name base
WORKDIR /home/jovyan/ChaosBench

RUN echo "conda activate base" >> ~/.bashrc
CMD ["bash"]
