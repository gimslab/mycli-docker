FROM ubuntu

RUN apt-get update
RUN apt-get -y install mycli
RUN apt-get -y install less
RUN apt-get -y install netcat

RUN echo 'set -o vi' >> ~/.bashrc
ADD .myclirc /root/.myclirc

ENV WORK_DIR /workspace
ENV RUN_SCRIPT $WORK_DIR/run.sh
WORKDIR $WORK_DIR

RUN mkdir -p $WORK_DIR

ADD run.sh $WORK_DIR/run.sh

RUN chmod 755 $RUN_SCRIPT

ENTRYPOINT ["/workspace/run.sh"]

