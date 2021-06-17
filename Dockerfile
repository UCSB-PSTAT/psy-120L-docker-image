#FROM dddlab/base-rstudio:v20200403-24905f8-94fdd01b492f
FROM ucsb/r-base:v20210120.1

LABEL maintainer="Patrick Windmiller <windmiller@pstat.ucsb.edu>"

USER root

RUN R -e "install.packages(c('WDI', 'faraway', 'boot', 'car', 'pscl', 'vcd', 'stargazer', 'effsize', 'Rmisc', 'psych'))"

USER $NB_USER
