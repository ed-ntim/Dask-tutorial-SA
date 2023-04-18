#!/bin/bash
#PBS -N test_mpi_dask
#PBS -P WCHPC 
#PBS -l select=1:ncpus=12:mpiprocs=6
#PBS -l walltime=00:10:00
#PBS -j oe 
#PBS -m abe
#PBS -M sdigioia@sissa.it



cd $PBS_O_WORKDIR
module load chpc/cuda/11.2/SXM2/11.2 chpc/openmpi/4.0.0/gcc-7.3.0 chpc/openblas/0.2.19/gcc-6.1.0 chpc/astro/anaconda/3
source /home/sdigioia/.bashrc
conda activate py310



# Qsub template for initializing a Dask cluster with dask-mpi
# Scheduler: PBS

# This script writes a scheduler.json file into your home directory
# You can then connect with the following Python code
# >>> from dask.distributed import Client
# >>> client = Client(scheduler_file='~/scheduler.json')

rm -f scheduler.json
mpirun --np 6 dask-mpi \
    --nthreads 2 \
    --memory-limit 24e9 \
    --interface ib0
