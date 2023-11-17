# Inherit from an upstream image
FROM pangeo/pangeo-notebook:2023.11.14

COPY environment.yml /tmp/environment.yml

RUN mamba env update --name notebook --file /tmp/environment.yml
RUN conda activate notebook && pip install -e git+https://github.com/jakobrunge/tigramite.git#egg=tigramite[all]

RUN ls
