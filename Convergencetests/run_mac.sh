#!/bin/sh

BIN_DIR=/Users/piccinin/Software/espresso-5.0.2/bin

mpirun -np 2 $BIN_DIR/pw.x < Si.sample.in > Si.sample.out &

exit 0
