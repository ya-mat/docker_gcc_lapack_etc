# Copyright (c) 2020--2025 ya-mat (https://github.com/ya-mat/docker_gcc_lapack_etc)
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM gcc:latest

RUN apt update && apt install -y gdb && \
    apt install -y cmake && \
    git clone https://github.com/ya-mat/lapack_etc_make.git && \
    cd lapack_etc_make && \
    sed -e 's/ln -s/cp -r/g' ./make.sh > ./make.tmp && \
    cp make.tmp make.sh && \
    chmod u+x make.sh && \
    ulimit -s unlimited && \
    env CC=gcc CXX=g++ FC=gfortran F90=gfortran F77=gfortran ./make.sh && \
    cp -r lib/* /usr/local/lib/ && \
    cp -r share/* /usr/local/share/ && \
    cp -r include/* /usr/local/include/ && \
    cp -r eigen-3.4.0/Eigen/ /usr/local/include/ && \
    cp -r eigen-3.4.0/unsupported/ /usr/local/include/ && \
    cd ../ && \
    rm -rf lapack_etc_make

#RUN mkdir cmake_build && \
#    cd cmake_build && \
#    wget https://github.com/Kitware/CMake/releases/download/v3.26.4/cmake-3.26.4.tar.gz && \
#    tar zxvf cmake-3.26.4.tar.gz && \
#    cd cmake-3.26.4 && \
#    ./bootstrap && make && make install && \
#    cd ../../ && \
#    rm -rf cmake_build && \
#    apt update && apt install -y gdb && \
#    apt install -y cmake && \
#    git clone https://github.com/ya-mat/lapack_etc_make.git && \
#    cd lapack_etc_make && \
#    sed -e 's/ln -s/cp -r/g' ./make.sh > ./make.tmp && \
#    cp make.tmp make.sh && \
#    sh make.sh && \
#    cp -r lib/* /usr/local/lib/ && \
#    cp -r share/* /usr/local/share/ && \
#    cp -r include/* /usr/local/include/ && \
#    cp -r eigen-3.4.0/Eigen/ /usr/local/include/ && \
#    cp -r eigen-3.4.0/unsupported/ /usr/local/include/ && \
#    cd ../ && \
#    rm -rf lapack_etc_make

WORKDIR /workdir
#CMD ["bash"]