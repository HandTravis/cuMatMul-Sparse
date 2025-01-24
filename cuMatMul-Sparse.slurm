#!/bin/bash

#SBATCH --job-name=obls-tst

#SBATCH --account=amath

#SBATCH --partition=gpu-rtx6k

#SBATCH --nodes=1

#SBATCH --ntasks-per-node=4

#SBATCH --mem=5G

#SBATCH --gpus=1

#SBATCH --time=00-00:05:00

#SBATCH --chdir=/mmfs1/home/tjhand/amath483/hw6/p3

#SBATCH --export=all

#SBATCH --output=sparsematmul_out.txt # where STDOUT goes

#SBATCH --error =sparsematmul_err.txt # where STDERR goes

 

# Modules to use (optional).

module load gcc cuda/12.0.0
 

# make certain the loader can access the fftw library

export PATH=/gscratch/amath/roche-libs/bin:$PATH

export LD_LIBRARY_PATH=/gscratch/amath/roche-libs/lib:$LD_LIBRARY_PATH

cp sparsematmul.cpp sparsematmul.cu
nvcc -c -arch sm_75 -I/gscratch/amath/roche-libs/include/ sparsematmul.cu 
nvcc -o xsparsematmul sparsematmul.o -L/mmfs1/gscratch/amath/roche-libs/lib -L/sw/cuda/12.0.0/lib64 -lcublas -lcudart -lcufft -I/gscratch/amath/roche-libs/include/ -lm

./xsparsematmul