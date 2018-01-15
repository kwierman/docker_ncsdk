FROM  ubuntu:bionic

MAINTAINER Kevin Wierman <kwierman@gmail.com>

RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install lightdm -y
RUN apt-get install -y  libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
RUN apt-get install -y --no-install-recommends libboost-all-dev
RUN apt-get install -y bash git make wget sudo python3-pip libopencv-dev python-opencv cmake caffe-cuda
RUN pip3 install -U pip
RUN python3 -m pip install --upgrade https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-0.12.0-py3-none-any.whl

RUN mkdir -p /workspace
WORKDIR /workspace
RUN git clone https://github.com/movidius/ncsdk.git
WORKDIR /workspace/ncsdk
RUN chmod +x *.sh
RUN sync
RUN export PATH=$PATH:/bin:/usr/bin ; ./install-opencv.sh
RUN export PATH=$PATH:/bin:/usr/bin ; ./install.sh

CMD bash

#docker run -t -i --privileged -v /dev/bus/usb:/dev/bus/usb ubuntu bash