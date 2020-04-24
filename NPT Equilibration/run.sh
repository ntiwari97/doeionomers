#!/bin/bash

moltemplate.sh system.lt

# run with 6 mpi processes (6 cores) 
mpirun -np 6 lmp_mpi -in min.in.nve

mpirun -np 6 lmp_mpi -in system.in.npt

