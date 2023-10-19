FROM ubuntu:22.04 AS builder

ARG GO_SPACEMESH_VERSION


RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ocl-icd-libopencl1 curl unzip



RUN [ "/bin/bash", "-c",  "curl -L -o /tmp/Linux.zip \"https://storage.googleapis.com/go-spacemesh-release-builds/${GO_SPACEMESH_VERSION}/Linux.zip\" && unzip /tmp/Linux.zip && mkdir -p /opt/spacemesh/ && mv Linux/* /opt/spacemesh && rmdir Linux" ]

COPY ./run /opt/spacemesh

RUN chmod +x /opt/spacemesh/profiler # Installer doesn't do this for some reason


RUN adduser --disabled-password --gecos '' spacemesh && chown -R spacemesh /home/spacemesh

USER spacemesh
WORKDIR /home/spacemesh

EXPOSE 7513
EXPOSE 9090
EXPOSE 9092
EXPOSE 9093


