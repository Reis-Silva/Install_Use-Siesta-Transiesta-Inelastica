
for i in `seq -w 0.000 0.005 0.100`  # Escolher a variação de corrente para o EigenChannels
do

cd $i

EigenChannels --format=cube --BothSides --MolecularStates=3 --Res=0.1 MPSH

cd ..

done


