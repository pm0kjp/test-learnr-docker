# Shiny server with some packages installed
FROM rocker/shiny
MAINTAINER Joy Payton <k.joy.payton@gmail.com>
RUN sudo apt-get update && apt-get install -y \
         nano \
         libssl-dev \
         libxml2-dev

# So nano works
ENV TERM xterm

# custom packages
RUN sudo su - -c "R -e \"install.packages(c('DT','zoo','devtools','shinydashboard','dplyr','plotrix','ggplot2','lubridate','stringr', 'learnr'), repos='http://cran.rstudio.com/')\""

COPY socrata-api /srv/shiny-server/socrata-api
