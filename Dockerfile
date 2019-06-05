FROM golang:1.12.5-stretch
MAINTAINER jouyouyun <jouyouwen717@gmail.com>

RUN echo 'deb http://ftp.cn.debian.org/debian/ stable main contrib non-free' > /etc/apt/sources.list
RUN echo 'deb http://ftp.cn.debian.org/debian/ stable-updates main contrib non-free' >> /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/mongodb/apt/debian stretch/mongodb-org/3.6 main" | tee /etc/apt/sources.list.d/mongodb-org-3.6.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
RUN apt-get update
RUN apt-get install -y --no-install-recommends wget ca-certificates mongodb-org mongodb-org-tools
#RUN apt-get install -y --no-install-recommends wkhtmltopdf
RUN apt-get autoclean

RUN wget https://nchc.dl.sourceforge.net/project/leanote-bin/2.6.1/leanote-linux-amd64-v2.6.1.bin.tar.gz
#RUN wget http://jouyouyun.top:8000/leanote-linux-amd64-v2.6.1.bin.tar.gz
ENV LEANOTE_DIR=/opt/leanote-v2.6.1
RUN mkdir -p ${LEANOTE_DIR}
RUN tar -zxf leanote-linux-amd64-v2.6.1.bin.tar.gz -C ${LEANOTE_DIR}
WORKDIR ${LEANOTE_DIR}
RUN chmod +x ${LEANOTE_DIR}/leanote/bin/run.sh
CMD ["./leanote/bin/run.sh"]
