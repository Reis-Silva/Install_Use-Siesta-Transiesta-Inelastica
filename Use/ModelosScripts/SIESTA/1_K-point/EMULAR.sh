mkdir cont #criando direitorio cont

for k in `seq -w 0 5 70`  #variação da unidade
do

cp -r cont $k
cd $k
cp ../*.psf .

cat > EMULAR.fdf <<EOF

SystemName  ElecL
SystemLabel ElecL

# K-points/ recomenda-se a estabilidade da energia 

#escolher qual k-point irá variar
%block kgrid_Monkhorst_Pack       
  1   0   0     0.0
  0   1   0     0.0
  0   0  $k     0.0
%endblock kgrid_Monkhorst_Pack

# Basis set variables
PAO.BasisType split
PAO.BasisSize DZP
PAO.SplitNorm         0.15
PAO.EnergyShift       275 meV


# General variables

# Exchange-correlation version
#NeglNonOverlapInt     true
ElectronicTemperature  300 K
OccupationFunction      FD
SolutionMethod         diagon 
MeshCutoff             300. Ry
xc.functional          LDA          # Exchange-correlation functional
xc.authors             CA 
SpinPolarized          false 
          

#ESPECIFIC

#BulkTransport       T
#InitTransport       F
#BulkLead            L

#########################################

# SCF variables

DM.MixSCF1            true
MaxSCFIterations      1000           # Maximum number of SCF iter
DM.MixH               true    
DM.MixingWeight       0.05          # New DM amount for next SCF cycle
DM.Tolerance          1.d-4         # Tolerance in maximum difference
DM.UseSaveDM          true          # to use continuation files
DM.NumberPulay         6

# MD variables

MD.NumCGsteps     000
#MD.FinalTimeStep 	1
#MD.TypeOfRun 		CG 
#MD.UseSaveXV      true

# Output variables

#mesh used by DHSCF,This file can be read by routinen IORHO

WriteMullikenPop                1
WriteBands                      false
WriteCoorXmol                   true
WriteMDXmol                     true
WriteMDhistory                  false
WriteDM                         true
WriteEigenvalues                true
WriteKBands                     false
WriteCoorInitial                false
WriteWaveFunctions              false
WriteForces                     true



#Saves

#SaveRho                         false  #file .RHO
#SaveDeltaRho                    false  #SystemLabel.DRHO
#SaveElectrostaticPotential      true #SystemLabel.VH
#SaveTotalPotential              true #SystemLabel.VT	
#SaveTotalCharge				 true #SystemLabel.TOCH	
#TS.HS.Save                      true
#TS.DE.Save			             true
SaveHS                           true




NumberOfAtoms 12
NumberOfSpecies 1
%block ChemicalSpeciesLabel
  1  79  Au
%endblock ChemicalSpeciesLabel
LatticeConstant 1.0 Ang
%block LatticeVectors
     0.000000      0.000000      0.000000
     0.000000      0.000000      0.000000
     0.000000      0.000000      0.000000
%endblock LatticeVectors
AtomicCoordinatesFormat  Ang
%block AtomicCoordinatesAndAtomicSpecies



    
%endblock AtomicCoordinatesAndAtomicSpecies
                                                  
                                                   

EOF

mpirun --oversubscribe -np 4 siesta <EMULAR.fdf| tee RESULTADO.fdf

cd ..
rm -rf cont
mkdir cont


done
