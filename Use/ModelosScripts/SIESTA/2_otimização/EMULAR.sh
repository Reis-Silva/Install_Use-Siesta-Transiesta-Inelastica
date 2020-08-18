#!bin/bash/csh

mkdir cont

#for k in `seq -w 25.988600 0.200000 28.788600`

for k in `seq -w 26.8886 0.25 27.8886`
do

cp -r cont $k

cd $k
cp ../*.psf .

cat > EMULAR.fdf <<EOF

SystemName    Ouro                                                                                                               
SystemLabel   Ouro

NumberOfSpecies        1
NumberOfAtoms         70

LatticeConstant             1.00 Ang

%block LatticeVectors
    10.000000      0.000000      0.000000
     0.000000     20.000000      0.000000
     0.000000      0.000000     $k			
%endblock LatticeVectors

%block ChemicalSpeciesLabel
  1   79  Au
%endblock ChemicalSpeciesLabel

AtomicCoordinatesFormat Ang

%block AtomicCoordinatesAndAtomicSpecies



%endblock AtomicCoordinatesAndAtomicSpecies



%block kgrid_Monkhorst_Pack
1   0   0    0
0   1   0    0
0   0   1    0
%endblock kgrid_Monkhorst_Pack

xc.functional           GGA                      
xc.authors              PW91                     

MeshCutoff              300.00 Ry 
SolutionMethod          diagon                   
OccupationFunction      MP                       
ElectronicTemperature   300.00 K                    

SpinPolarized           false                        
FixSpin                 false                        

MaxSCFIterations        300                      
                   
DM.NumberPulay          6                        
DM.NumberBroyden        0                        
DM.MixingWeight         0.02000000000             
DM.OccupancyTolerance  0.1000000000E-11   
      
#DM.Converge         true                       
#DM.Tolerance        1E−04 #padrão 10 −4 use the density matrix elements as monitor of self-consistency  
#H.Converge          true
H.Tolerance         1E−03 #padrão 10 −3 dHmax              
UseSaveData             true                        

         

MD.NumCGsteps           5# NUMERO DE PASSOS DO MÉTODO DE OTIMIZAÇÃO PARA PROCURA O MÍNIMO VALOR À 0,02EV/ANG                      
MD.TypeOfRun            CG                       
MD.VariableCell         false                        
MD.MaxCGDispl           0.2000000000  Bohr       
MD.MaxForceTol          0.04 eV/Ang              
#MD.MaxStressTol        0.001 eV/Ang**3

Diag.ParallelOverK      true                        
                       
PAO.EnergyShift         85 meV                   
PAO.SplitNorm           0.1500000000             
PAO.BasisType           split
PAO.BasisSize           SZP                    
         
                          
WriteMullikenPop        0      
WriteDenchar            true      
WriteKpoints            true      
WriteForces             true      
WriteDM                 true      
WriteXML                true      
WriteBands              false      
WriteKbands             false      
WriteEigenvalues        true      
WriteCoorStep           true      
WriteMDhistory          true      
WriteMDXmol             true      
WriteWaveFunctions      false      
WriteCoorXmol           true   # ARQUIVO XYZ DA ESTRUTURA    


#CONGELAR ALGUMA PARTE DA ESTRUTURA
 %block GeometryConstraints
  position from 1 to 32
  position from 39 to 70
 %endblock GeometryConstraints

UseSaveData             true
==============================================
==============================================

EOF

mpirun --oversubscribe -np 4 siesta < EMULAR.fdf | tee RESULTADO.out

cd ..

rm -rf cont

mkdir cont


done
