FROM golang:1.12.5-stretch
MAINTAINER jouyouyun <jouyouwen717@gmail.com>

RUN echo 'deb http://cn.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse' > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install wget ca-certificates
RUN apt-get autoclean

RUN wget https://nchc.dl.sourceforge.net/project/leanote-bin/2.6.1/leanote-linux-amd64-v2.6.1.bin.tar.gz
ENV LEANOTE_DIR=/opt/leanote-v2.6.1
RUN mkdir -p ${LEANOTE_DIR}
RUN tar -zxf leanote-linux-amd64-v2.6.1.bin.tar.gz -C ${LEANOTE_DIR}
WORKDIR ${LEANOTE_DIR}
RUN chmod +x ${LEANOTE_DIR}/leanote/bin/run.sh
CMD ["./leanote/bin/run.sh"]
