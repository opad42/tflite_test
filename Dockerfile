# Container image that runs your code
FROM ubuntu:latest

RUN apt update && apt install --yes --force-yes swig libjpeg-dev zlib1g-dev python3-dev python3-numpy wget git python3-pip bazel && pip3 install numpy pybind11

RUN git clone https://github.com/tensorflow/tensorflow && cd tensorflow && wget https://github.com/bazelbuild/bazel/releases/download/5.2.0/bazel-5.2.0-linux-x86_64 && \
mv bazel-5.2.0-linux-x86_64 bazel && export PATH=$PATH:. && bash tensorflow/lite/tools/pip_package/build_pip_package_with_bazel.sh windows
