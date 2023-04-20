#!/bin/bash -x

C_FLAGS="-O3"
# -xMIC-AVX512"
mpicc ${C_FLAGS} -c benchmark_LBE3D_IO.c -I/home/apps/chpc/compmech/spack/opt/spack/linux-centos7-haswell/gcc-9.2.0/hdf5-1.12.2-gvydabuqenshywafz46o2cqkgoa22xvo/include
mpicc ${C_FLAGS} -o benchmark_LBE3D_IO.x benchmark_LBE3D_IO.o -L/home/apps/chpc/compmech/spack/opt/spack/linux-centos7-haswell/gcc-9.2.0/hdf5-1.12.2-gvydabuqenshywafz46o2cqkgoa22xvo/lib -lhdf5 -lm
