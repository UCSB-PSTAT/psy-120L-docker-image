#FROM dddlab/base-rstudio:v20200403-24905f8-94fdd01b492f
FROM jupyter/r-notebook

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN apt update -qq && \
    apt upgrade -y && \
    apt install -y \
        software-properties-common \
        lsof \
        less \
        libapparmor1 \
        libtiff5-dev \
        libfftw3-dev \
        libcairo2-dev \
        libx11-dev \
        x11-utils \
        psmisc \
        libclang-dev \
        gfortran \
        libv8-dev \
        libssh2-1-dev \
## install git command line
        git \
## install RStudio Server session components
        curl \
        libuser \
        libuser1-dev \
        libpq-dev \
        rrdtool \  
## install rstan build reqs
        build-essential \
        libxml2-dev \
        libcurl4-openssl-dev \
        libssl-dev && \
    apt-get clean 

RUN pip install jupyter-server-proxy jupyter-rsession-proxy nbgitpuller && \
    jupyter serverextension enable --py nbgitpuller --sys-prefix 
    
RUN R -e "install.packages(c('shiny','usethis','covr','httr','roxygen2','rversions','devtools','igraph','imager','patchwork','littler', 'docopt','curl','httr','WDI', 'faraway', 'boot', 'car', 'pscl', 'vcd', 'stargazer', 'effsize', 'Rmisc', 'psych', 'afex', 'tidyverse', 'Rmisc', 'afex')),Ncpus = parallel::detectCores())"

RUN R -e "devtools::install_github('bradleyboehmke/harrypotter')"

RUN R -e "devtools::install_github('gbm-developers/gbm3')"

RUN R -e "devtools::install_github('ucbds-infra/ottr@0.0.2')"

USER $NB_USER
