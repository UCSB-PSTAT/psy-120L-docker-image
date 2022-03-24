FROM ucsb/rstudio-base

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN R -e "install.packages(c('psych', 'afex', 'hmisc', 'emmeans'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

USER $NB_USER
