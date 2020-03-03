FROM rycus86/pycharm-pro:latest

LABEL maintainer "Vladislav Yevtushenko <vladislav.yevtushenko@gmail.com>"

ARG AWSCLI_URL="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"

USER  root
RUN apt-get update && apt-get install --no-install-recommends -y  unzip 

RUN curl -o "awscliv2.zip" ${AWSCLI_URL} \
  && unzip awscliv2.zip \ 
  && rm awscliv2.zip \
  && /opt/pycharm/aws/install

USER developer
CMD [ "/opt/pycharm/bin/pycharm.sh" ]
