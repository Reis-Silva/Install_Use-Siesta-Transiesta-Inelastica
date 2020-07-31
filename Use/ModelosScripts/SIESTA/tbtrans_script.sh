for i in `seq -w 0.00 0.10 1.00`  # Escolher a variação da corrente
do

cd $i

#mpirun --oversubscribe -np 8 tbtrans < INPUT.fdf | tee  OUTPUT_tbt.fdf  #  &  # if you have more than 19 cpu-core, remove the first # on this line !

mpirun --oversubscribe -np 4 tbtrans < INPUT.fdf | tee  OUTPUT_tbt.fdf

cd ..

done


