FROM ubuntu:18.04

ENV TZ 'Asia/Shanghai'
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt install -y tzdata apt-utils build-essential ccache ecj fastjar file g++ gawk \
gettext git java-propose-classpath libelf-dev libncurses5-dev \
libncursesw5-dev libssl-dev python python2.7-dev python3 unzip wget \
python3-distutils python3-setuptools rsync subversion swig time \
xsltproc zlib1g-dev iputils-ping vim dnsutils sudo ;  \
/usr/sbin/useradd t -d /opt/ -s /bin/bash
RUN echo 't ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

USER t
WORKDIR /opt 
ENTRYPOINT while [ 1 -eq 1 ] ; do sleep 1 ;done
