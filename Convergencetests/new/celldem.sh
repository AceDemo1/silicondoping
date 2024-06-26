#!/bin/sh
####################################################
# This is a sample script to run scf total-energy
# calculations on a unit cell of Si using three 
# different values for the input parameter 
# 'ecutwfc' (the plane-wave cutoff).
#
# Brandon Wood, 21-07-08
#
# You should copy this file and modify it as 
# appropriate for the tutorial.
####################################################
# Notes:
#
# 1. You can loop over a variable by using the 
#    'for...do...done' construction. As an example, 
#    this code loops over three different values
#    of ecut (5, 10, 15), designated by a
#    variable called CUTOFF.
# 2. Variables can be referred to within the script 
#    by typing the variable name preceded by the '$' 
#    sign. So whenever $CUTOFF appears in the 
#    script, it will be replaced by its current 
#    value.
#
####################################################
# Important initial variables for the code
# (change these as necessary)
####################################################

NAME='celldm'

####################################################

for celldm in  10 15 20 25 30
do
cat > $NAME.$celldm.in << EOF
 &control
    calculation = 'scf',
    prefix = 'Si_exc1'
   pseudo_dir='/home/lawal/exercise1/psudo'
 /
 &system
    ibrav =  2, 
    celldm(1) = $celldm, 
    nat =  2, 
    ntyp = 1,
    ecutwfc = 17
 /
 &electrons
    mixing_beta = 0.7
 /

ATOMIC_SPECIES
 Si 28.086  Si.pbe-rrkj.UPF

ATOMIC_POSITIONS (alat)
 Si 0.0 0.0 0.0
 Si 0.25 0.25 0.25

K_POINTS (automatic)
  6 6 6 1 1 1
EOF

pw.x < $NAME.$celldm.in > $NAME.$celldm.out

done

