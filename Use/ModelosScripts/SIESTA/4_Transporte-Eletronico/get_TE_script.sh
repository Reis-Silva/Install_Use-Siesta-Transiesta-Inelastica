for volts in `seq -w 0.00 0.10 1.00` #Escolha as variações das tensões, O script promove as 3 grandezas (T,E,V) já ajustadas no software origin ou outro programa tridimensional. Cuidado com os formatos de entrada das pontuações ". ou ,"

do

cd $volts

#modifitque somente o nome "scat" de acordo com o SystemLabel do seu script da bias.

cat scat.TBT.AVTRANS_Left-Right | awk 'NR>=4  {print " "$1"	"$2"	"'$volts'}' >> ../Transmittance.dat 

cd ..

done
