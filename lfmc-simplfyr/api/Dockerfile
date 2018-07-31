FROM rocker/r-ver:3.4
MAINTAINER Jaehyeon Kim <dottami@gmail.com>

RUN apt-get update
RUN apt-get install -y jq wget supervisor

## Rserve
RUN apt-get install -y libssl-dev
RUN apt-get install -y libprotobuf-dev
RUN apt-get install -y libjq-dev
RUN apt-get install -y curl libcurl4-openssl-dev

RUN wget http://www.rforge.net/Rserve/snapshot/Rserve_1.8-5.tar.gz \
    && R CMD INSTALL Rserve_1.8-5.tar.gz

RUN R -e 'install.packages(c("Rook", "rjson", "rgeos", "raster", "jsonlite", "geojsonio", "rmapshaper", "spdplyr", "rgdal", "curl", "codetools", "jqr", "V8", "httr", "geojsonlint"))'

RUN echo '/usr/local/lib/R/lib/' >> /etc/ld.so.conf.d/libR.conf \
    && ldconfig

## copy sources to /home/docker
RUN useradd docker && mkdir /home/docker \
	&& chown docker:docker /home/docker

RUN mkdir /home/docker/rserve


COPY ./src/rserve /home/docker/rserve/
RUN mkdir /home/docker/rserve/data

COPY ./src/api-supervisor.conf /home/docker/api-supervisor.conf
RUN chmod -R 755 /home/docker

EXPOSE 8000
CMD ["/usr/bin/supervisord", "-c", "/home/docker/api-supervisor.conf"]
