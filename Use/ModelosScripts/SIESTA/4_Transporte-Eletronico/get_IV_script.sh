for k in `seq -w 0.00 0.10 1.00`  #Escolha as variações das tensões
do

cd $k

# O nome "OUTPUT_tbt" varia de acordo com o nome de saída aderida.

cat OUTPUT_tbt.fdf | fgrep "Left -> Right, V [V] / I [A]:" | awk '{print "'$k'	"$12}' >> ../IV.dat

cd ..

done
