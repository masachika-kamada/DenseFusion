FROM nvidia/cuda:11.0.3-cudnn8-devel-ubuntu18.04

USER root
# Essentials: developer tools, build tools, OpenBLAS
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils git curl vim unzip openssh-client wget \
    build-essential cmake \
    libopenblas-dev \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgl1-mesa-dev

RUN curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | apt-key add - && \
    curl -s -L https://nvidia.github.io/nvidia-docker/$(. /etc/os-release;echo $ID$VERSION_ID)/nvidia-docker.list | tee /etc/apt/sources.list.d/nvidia-docker.list
RUN curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | apt-key add - && \
    curl -s -L https://nvidia.github.io/nvidia-container-runtime/$(. /etc/os-release;echo $ID$VERSION_ID)/nvidia-container-runtime.list | tee /etc/apt/sources.list.d/nvidia-container-runtime.list

RUN apt-get update && apt-get install -y nvidia-container-toolkit nvidia-container-runtime

RUN apt update && apt -y upgrade

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends python3.6 python3.6-dev python3-pip python3-tk && \
    pip3 install --no-cache-dir --upgrade pip setuptools

RUN pip install \
    cycler==0.11.0 \
    dataclasses==0.8 \
    joblib==1.1.0 \
    kiwisolver==1.3.1 \
    matplotlib==3.3.4 \
    numpy==1.19.5 \
    opencv-python==3.4.18.65 \
    pillow==8.4.0 \
    pyparsing==3.0.9 \
    python-dateutil==2.8.2 \
    pyyaml==6.0 \
    scikit-learn==0.24.2 \
    scipy==1.5.4 \
    threadpoolctl==3.1.0 \
    torch==1.2.0 \
    torchvision==0.4.0 \
    typing-extensions==4.1.1

# Expose port for TensorBoard
EXPOSE 6006

# cd to home on login
RUN echo "cd /root/dense_fusion" >> /root/.bashrc