mkdir  cont #criando direitorio cont

for k in `seq -w 0 5 60`
do

cp -r cont $k
cd  $k
cp ../*.psf .

cat > K-point_estrutura.fdf <<EOF

SystemName  K-point_estrutura
SystemLabel K-point_estrutura

# K-points

%block kgrid_Monkhorst_Pack
 $k   0   0     0.0
  0  $k   0     0.0
  0   0   1     0.0
%endblock kgrid_Monkhorst_Pack

# Basis set variables
PAO.BasisType split
PAO.BasisSize SZP

# General variables

#NeglNonOverlapInt   True
ElectronicTemperature  300 K
SolutionMethod    diagon 
MeshCutoff           300. Ry
xc.functional         LDA          # Exchange-correlation functional
xc.authors            CA 
SpinPolarized        F 
          # Exchange-correlation version

#ESPECIFIC

#BulkTransport       T
#InitTransport       F
#BulkLead            L

#########################################

# SCF variables

DM.MixSCF1   T
MaxSCFIterations      1000           # Maximum number of SCF iter
DM.MixH               T    
DM.MixingWeight       0.05          # New DM amount for next SCF cycle
DM.Tolerance          1.d-4         # Tolerance in maximum difference
DM.UseSaveDM          true          # to use continuation files
DM.NumberPulay         10

# MD variables

MD.FinalTimeStep 1
MD.TypeOfRun CG 
MD.NumCGsteps     000
MD.UseSaveXV      true

# Output variables

#mesh used by DHSCF,This file can be read by routinen IORHO

WriteMullikenPop                1
WriteBands                      false
SaveRho                         false  #file .RHO
SaveDeltaRho                    false  #SystemLabel.DRHO
SaveHS                          false
SaveElectrostaticPotential      true #SystemLabel.VH
SaveTotalPotential              true #SystemLabel.VT	
SaveTotalCharge					true #SystemLabel.TOCH	
WriteCoorXmol                   true
WriteMDXmol                     true
WriteMDhistory                  false
WriteEigenvalues                true
Write.TSHS.History				true


NumberOfAtoms 72
NumberOfSpecies 2
%block ChemicalSpeciesLabel
  1  6  C
  2  1  H
%endblock ChemicalSpeciesLabel
LatticeConstant 1.0 Ang
%block LatticeVectors
    23.568900      0.000000      0.000000
     0.000000      9.000000      0.000000
     0.000000      0.000000     22.149000
%endblock LatticeVectors
AtomicCoordinatesFormat  Ang
%block AtomicCoordinatesAndAtomicSpecies


%endblock AtomicCoordinatesAndAtomicSpecies
                                                   

EOF

mpirun --oversubscribe -np 4 siesta <K-point_estrutura.fdf| tee RESULTADO.fdf

cd ..
rm -rf cont
mkdir  cont


done
