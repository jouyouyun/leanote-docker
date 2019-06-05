FROM mongo:3.6.12-xenial
MAINTAINER jouyouyun <jouyouwen717@gmail.com>

RUN echo 'deb http://cn.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse' > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install wget ca-certificates
RUN apt-get autoclean

# mongodb_init will be special by volume
#RUN wget https://nchc.dl.sourceforge.net/project/leanote-bin/2.6.1/leanote-linux-amd64-v2.6.1.bin.tar.gz
#ENV LEANOTE_DIR=/opt/leanote-v2.6.1
#RUN mkdir -p ${LEANOTE_DIR}
#RUN tar -zxf leanote-linux-amd64-v2.6.1.bin.tar.gz -C ${LEANOTE_DIR}
#ENV MONGODB_BACKUP=/opt/mongodb_backup
#RUN cp -rf ${LEANOTE_DIR}/leanote/mongodb_backup/leanote_install_data ${MONGODB_BACKUP}

RUN mkdir -p /data/db
RUN mkdir -p /usr/local/bin
COPY start-db.sh /usr/local/bin/start-db.sh

CMD ["/usr/local/bin/start-db.sh"]
