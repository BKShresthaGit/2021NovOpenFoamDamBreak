#!/bin/bash
#SBATCH -J damBreakOriginal      # Job name
#SBATCH -p quad       # name of partition for QE calculation
#SBATCH -o job.%j.out    # Name of stdout output file (%j expands to jobId)
#SBATCH -N 1             # Total number of nodes requested
#SBATCH -n 4             # Total number of mpi tasks requested
#SBATCH -t 00:10:00      # Run time (hh:mm:ss)

# load needed modules
module load gnu8/8.3.0
module load fftw/3.3.9
module load openmpi/4.1.1

source /mnt/storage0/software/OpenFOAM-v2012/etc/bashrc

# commands related to OpenFOAM
blockMesh > log.blockMesh
setFields > log.setFileds
decomposePar > log.decomposePar
mpirun -np 4 interFoam -parallel > log.interFoam
reconstructPar > log.reconstructPar
