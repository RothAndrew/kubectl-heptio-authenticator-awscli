FROM ubuntu:18.04

ENV AWS_CLI_VERSION 1.15.40

RUN apt-get update && apt-get install -y curl python python-pip python-dev build-essential && \
    pip install --upgrade pip==9.0.3 && \
    pip install --upgrade virtualenv && \
    pip --no-cache-dir install awscli==${AWS_CLI_VERSION} && \
    curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    cp ./kubectl /usr/bin && \
    curl -o heptio-authenticator-aws https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/bin/linux/amd64/heptio-authenticator-aws && \
    chmod +x ./heptio-authenticator-aws && \
    cp ./heptio-authenticator-aws /usr/bin