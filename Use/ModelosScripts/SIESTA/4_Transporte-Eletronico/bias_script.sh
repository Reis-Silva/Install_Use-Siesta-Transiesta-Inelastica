#!/bin/sh


#cp ../electrode/*.TSHS   .  # copy TSHS file from step-1

#cp  ../0.0/scat.TSDE .         # <= Essas três linhas são para o cálculo IV_Negat.
#cp ../0.0/scat.TSHS .
#cp ../0.0/scat.DM .

mkdir cont   # read the comment at the end of this script.

for k in `seq -w 0.00 0.10 1.00`  #Escolha as variações das tensões
do

cp -r cont $k
cd $k
cp ../*.psf .
cp ../*.TSHS .

# Names
cat > INPUT.fdf <<EOF

SystemName scat                                                                                                                                                                                                        
SystemLabel   scat

# Basis set variables
NumberOfSpecies 1
%block ChemicalSpeciesLabel
  1   6  C
%endblock ChemicalSpeciesLabel

PAO.BasisType           split
PAO.BasisSize           SZP        
WriteMullikenPop        1
WriteBands              F
xc.functional           LDA                     
xc.authors              CA 

# Converges settings                
MeshCutoff              300.00000000 Ry 
SolutionMethod          Diagon                      
OccupationFunction      MP                      
ElectronicTemperature   300 K                   

SpinPolarized           F                       
FixSpin                 F                       

MaxSCFIterations        1000                    
                   
DM.NumberPulay          4                       
DM.NumberBroyden        0                       
DM.MixingWeight         0.02000000000  # 0.1 ANTERIORMENTE           
DM.OccupancyTolerance   0.1000000000E-11        
DM.NumberKick           0                       
DM.KickMixingWeight     0.01000000000            
DM.Tolerance            0.1000000000E-03        

#SCF.DM.Converge     true
#SCF.DM.Tolerance    1.000000000E-04

#SCF.H.Converge      true
#SCF.H.Tolerance     1.000000000E-03 ev

#EDM.Converge    true
#EDM.Tolerance   0.2000000000E+02

#FreeE.Converge true
#Harris.Converge true

# Steps       
MD.NumCGsteps           0                        
MD.TypeOfRun            CG                       
MD.VariableCell         F                        
MD.MaxCGDispl           0.1500000000  Ang       
MD.MaxForceTol          0.05 eV/Ang              
#MD.MaxStressTol        0.0001 eV/Ang**3        
MD.UseSaveXV            .true.

Diag.ParallelOverK      F                                                
PAO.EnergyShift         85.0 meV  # 50.0 meV anteriormente                   
PAO.SplitNorm           0.1500000000              

# SAVES
SaveRho                         F
SaveElectrostaticPotential      F
SaveTotalPotential              F
WriteCoorXmol                   T
SaveDeltaRho                    .false.
SaveHS                          T
TS.HS.Save                      T
TS.SaveHS                       T
TS.DE.Save                      T
UseSaveData                     T
DM.UseSaveDM                    T          # to use continuation files
UseSaveData                     T
                                                                                                                          
# ATOMIC POSITIONS
# Atomic coordinates

WriteMDXmol                     T
WriteMDhistory                  F
WriteEigenvalues                T

NumberOfAtoms                    16 #Numero de atomos da  estrutura
AtomicCoordinatesFormat         Ang

%block AtomicCoordinatesAndAtomicSpecies




%endblock AtomicCoordinatesAndAtomicSpecies


# UNIT CELL
LatticeConstant       1.00 Ang 

%block LatticeVectors 
       20.000000    0.000000    0.000000
        0.000000   20.000000    0.000000
        0.000000    0.000000   20.000000
%endblock LatticeVectors


# K-points

%block kgrid_Monkhorst_Pack
1   0   0   0.0
0   1   0   0.0
0   0   45  0.0
%endblock kgrid_Monkhorst_Pack
                                                  
TS.Voltage    $k eV

PAO.SplitNorm         0.15

%block TS.ChemPots
  Left
  Right
%endblock TS.ChemPots


%block TS.ChemPot.Left
  mu V/2
  contour.eq
    begin
      c-Left
      t-Left
    end
%endblock TS.ChemPot.Left


%block TS.ChemPot.Right
  mu -V/2
  contour.eq
    begin
      c-Right
      t-Right
    end
%endblock TS.ChemPot.Right

TS.Elecs.Bulk true

TS.Elecs.DM.Update none

TS.Elecs.GF.ReUse true


%block TS.Elecs
  Left
  Right
%endblock TS.Elecs

%block TS.Elec.Left
  HS electrode_left.TSHS
  chem-pot Left
  semi-inf-dir -a3
  elec-pos begin 1
  used-atoms 4 #Numero de atomos do eletrodo esquerdo
%endblock TS.Elec.Left

%block TS.Elec.Right
  HS electrode_right.TSHS
  chem-pot Right
  semi-inf-dir +a3
  elec-pos end -1
  used-atoms 4 #Numero de atomos do eletrodo direito
%endblock TS.Elec.Right

TS.Contours.Eq.Pole    2.50000 eV

%block TS.Contour.c-Left
  part circle
   from  -28.00000 eV + V/2 to -10. kT + V/2
    points 30
     method g-legendre
%endblock TS.Contour.c-Left

%block TS.Contour.t-Left
  part tail
   from prev to inf
    points 10
     method g-fermi
%endblock TS.Contour.t-Left

%block TS.Contour.c-Right
  part circle
   from  -28.00000 eV - V/2 to -10. kT - V/2
    points 30
     method g-legendre
%endblock TS.Contour.c-Right

%block TS.Contour.t-Right
  part tail
   from prev to inf
    points 10
     method g-fermi
%endblock TS.Contour.t-Right

TS.Elecs.Eta    0.0001000000 eV

%block TS.Contours.nEq
  neq
%endblock TS.Contours.nEq

%block TS.Contour.nEq.neq
  part line
   from -|V|/2 - 5 kT to |V|/2 + 5 kT
    delta 0.01 eV
     method mid-rule
%endblock TS.Contour.nEq.neq



# TBtrans options

TBT.Elecs.Eta    0.0000136058 eV
%block TBT.Contours
  neq
%endblock TBT.Contours

%block TBT.Contour.neq
  part line
   from   -1.50000 eV to    1.50000 eV
    delta    0.00998 eV
     method mid-rule
%endblock TBT.Contour.neq

#TBT.DOS.A T
#TBT.DOS.Gf T

TS.NumKyx_A1   1
TS.NumKyx_A2   1

TS.RegionDataOrtho false

TS.TBT.AtomPDOS            true
TS.TBT.DoCOOP              true

TS.TBT.PDOSFrom 1
TS.TBT.PDOSTo 16

Write.Graphviz atom+orbital#SystemLabel.ATOM.gv or SystemLabel.ORB.gv,neato -x -Tpng siesta.ATOM.gv -o siesta_ATOM.png
WriteIonPlotFiles true

==================================================
==================================================

EOF



mpirun --oversubscribe -np 4 siesta < INPUT.fdf  | tee OUTPUT.fdf  

cd ..
rm -rf cont 
mkdir cont

done

