for i in `seq -w 0.00 0.10 1.00`  #Escolha as variações das tensões.
do

cd $i

# Remover arquivos scat.TBT.nc por defeitos ocorridos no calculo do Tbtrans. Função para poder efetuar o recalculo da corrente.
# O nome "scat" varia de acordo com o SystemLabel.

rm scat.TBT.nc

cd ..

done


