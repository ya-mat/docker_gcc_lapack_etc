# Copyright (c) 2020--2023 ya-mat (https://github.com/ya-mat/docker_gcc_lapack_etc)
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM gcc:latest

RUN mkdir cmake_build && \
    cd cmake_build && \
    wget https://github.com/Kitware/CMake/releases/download/v3.26.4/cmake-3.26.4.tar.gz && \
    tar zxvf cmake-3.26.4.tar.gz && \
    cd cmake-3.26.4 && \
    ./bootstrap && make && make install && \
    cd ../../ && \
    rm -rf cmake_build && \
    apt update && apt install -y gdb && \
    git clone https://github.com/ya-mat/lapack_etc_make.git && \
    cd lapack_etc_make && \
    sed -e 's/ln -s/cp/g' ./make.sh > ./make.tmp && \
    cp make.tmp make.sh && \
    sh make.sh && \
    cp *.a /usr/local/lib/ && \
    cp -r Eigen/ /usr/local/include/ && \
    cp -r unsupported/ /usr/local/include/ && \
    cd ../ && \
    rm -rf lapack_etc_make

WORKDIR /workdir
#CMD ["bash"]