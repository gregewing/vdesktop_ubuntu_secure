FROM gregewing/vdesktop_ubuntu_base:latest
MAINTAINER Greg Ewing (https://github.com/gregewing)
ENV LANG=C.UTF-8 DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/London
COPY scripts /usr/local/bin

###  Set local repository  ###
RUN echo Starting.\
# && cp /etc/apt/sources.list /etc/apt/sources.list.default \
# && mv /usr/local/bin/sources.list.localrepo /etc/apt/sources.list \
 && apt-get -q -y update \
 && apt-get -q -y install \ 
#                         sudo \
#                         net-tools \
#                         iputils-ping \
                         epiphany-browser \
#                         mediainfo \
#                         libchromaprint-tools \
 && apt-get -q -y remove --purge gnome-screensaver \
 && apt-get -q -y full-upgrade \
 && apt-get -q -y clean \
###  Revert to default repositories  ###
# && mv /etc/apt/sources.list.default /etc/apt/sources.list \
 && echo Finished.

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

