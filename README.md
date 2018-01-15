# docker_ncsdk
Dockerfile for running software on the Movidius Neural Compute Stick

Dockerhub page: https://hub.docker.com/r/kwierman/movidius/

## Installation

~~~ bash
docker build -t kwierman/movidius .
~~~

### Bugfix

If the NCS is plugged into USB3.0, then when it switches modes, the docker image loses the connection. To fix this, add these lines the file: `/workspace/ncsdk/api/src/usb_boot.c`, inside the function `usb_find_device` after variable declaration, but before the rest of the code.

~~~ c
        libusb_exit(NULL);
        libusb_init(NULL);
~~~

This fix is credited to the discussion [here](https://ncsforum.movidius.com/discussion/394/ncs-access-in-a-docker-container-in-virtualbox-on-mac-osx). 


## Usage

~~~ bash
docker run -t -i -v /dev/bus/usb:/dev/bus/usb kwierman/movidius bash
~~~

For jupyter-notebook:

~~~ bash
docker run -t -i -v /dev/bus/usb:/dev/bus/usb -p 8888:8888 kwierman/movidius jupyter-notebook
~~~
