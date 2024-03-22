#!/bin/sh

#define MPI PATH
OMPI_HOME=/opt/software/compiler/openmpi/1.4.3/icc.ifort
BIN_DIR=/home/users/tutorial/bin

$OMPI_HOME/bin/mpirun --mca btl openib,self -np 2 -machinefile ../machines $BIN_DIR/pw.x < Si.supcell2.in > pw1.out &

exit 0
