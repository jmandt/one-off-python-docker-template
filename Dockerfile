FROM continuumio/miniconda3:4.6.14

RUN apt-get update

ADD environment.yml /tmp/environment.yml
RUN conda env create -f /tmp/environment.yml

RUN echo "source activate $(head -1 /tmp/environment.yml | cut -d' ' -f2) && conda deactivate" > ~/.bashrc

COPY python  ./home/python/

ENV PATH /opt/conda/envs/$(head -1 /tmp/environment.yml | cut -d' ' -f2)/bin:$PATH
ENV PYTHONPATH="$PYTHONPATH:/home/python-scripts"

RUN bash -c "source ~/.bashrc"
RUN bash -c "source activate $(head -1 /tmp/environment.yml | cut -d' ' -f2)"

ENTRYPOINT ["python", "home/python/run.py"]