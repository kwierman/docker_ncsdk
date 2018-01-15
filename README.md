# docker_ncsdk
Dockerfile for running software on the Movidius Neural Compute Stick

Dockerhub page: https://hub.docker.com/r/kwierman/movidius/

## Installation

~~~ bash
docker build -t kwierman/movidius .
~~~

## Usage

~~~ bash
docker run -t -i -v /dev/bus/usb:/dev/bus/usb kwierman/movidius bash
~~~

For jupyter-notebook:

~~~ bash
docker run -t -i -v /dev/bus/usb:/dev/bus/usb -p 8888:8888 kwierman/movidius jupyter-notebook
~~~
