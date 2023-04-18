#!/bin/bash

git clone https://github.com/Sera91/Dask-tutorial-SA.git

module load chpc/cuda/11.2/SXM2/11.2 chpc/openmpi/4.0.0/gcc-7.3.0 chpc/openblas/0.2.19/gcc-6.1.0 chpc/astro/anaconda/3

cd Dask-tutorial-SA

conda env create -f Sera_env.yml


cat conda_init.txt >>${HOME}/.bashrc


conda activate py310



