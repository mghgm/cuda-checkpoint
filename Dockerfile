FROM nvidia/cuda:12.9.1-cudnn-devel-ubuntu24.04

WORKDIR /home/ubuntu

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    vim \
    software-properties-common \
    netcat-openbsd \
    iproute2 \
    iputils-ping && \
    rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:criu/ppa -y && \
    apt-get update && \
    apt-get install -y criu && \
    rm -rf /var/lib/apt/lists/*

COPY ./bin/x86_64_Linux/cuda-checkpoint /usr/local/cuda/bin

CMD ["sleep 100000000"]
