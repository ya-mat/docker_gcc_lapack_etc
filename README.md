# docker_gcc_lapack_etc

This image add several libraries to [gcc](https://hub.docker.com/_/gcc) for gfortran and g++. Libraries are installed to '/usr/local/lib'.

## Install

```bash
docker pull yamat/gcc_lapack_etc
```

## Example usage

```bash
$ docker run --rm -it -v $PWD:/workdir yamat/gcc_lapack_etc
$ make
$ ./a.out
```

Path of installed libraries is '/usr/local/lib' or '/usr/local/include'.
