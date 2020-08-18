

for k in `seq -w 0 1 3`

do

cd $k



cat RESULTADO.fdf | grep "siesta:         Total = "  | awk '{print"'$k'      "$4}' >> ../energy_vs_K-point.dat

cd ..

done

