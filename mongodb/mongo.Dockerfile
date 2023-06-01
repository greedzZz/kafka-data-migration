FROM mongo:6.0.5

COPY .bashrc /data/db/.bashrc
RUN mkdir /scratch_space
RUN mkdir /scratch_space/src
RUN mkdir /scratch_space/dst
COPY sourceTopic.json /scratch_space/src
COPY destinationTopic.json /scratch_space/dst
ADD utils /usr/local/bin
RUN chmod +x /usr/local/bin/cx
RUN chmod +x /usr/local/bin/del
RUN chmod +x /usr/local/bin/kc
RUN chmod +x /usr/local/bin/status

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y curl
RUN apt-get install -y nano
RUN apt-get install -y kafkacat
RUN apt-get install -y git
RUN apt-get install -y dos2unix
RUN git clone https://github.com/RWaltersMA/stockgenmongo.git

RUN dos2unix /usr/local/bin/*
RUN dos2unix /data/db/.bashrc
