FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN apt update -qq && \
    apt install -y \
    libfreetype6 \
    libfreetype-dev \
    apt-get clean

RUN R -e "install.packages(c('psych', 'afex', 'Hmisc', 'emmeans', 'ggplot2', 'lsr', 'svglite'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

USER $NB_USER
