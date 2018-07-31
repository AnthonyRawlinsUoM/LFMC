FROM jupyter/all-spark-notebook

RUN conda install --quiet --yes \
    'r-rgeos' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER


WORKDIR /home/jovyan/work/notebooks

COPY ./notebooks .

CMD jupyter notebook