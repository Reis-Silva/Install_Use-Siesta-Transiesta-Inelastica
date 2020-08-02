# 
# Copyright (C) 1996-2016	The SIESTA group
#  This file is distributed under the terms of the
#  GNU General Public License: see COPYING in the top directory
#  or http://www.gnu.org/copyleft/gpl.txt.
# See Docs/Contributors.txt for a list of contributors.
#
#-------------------------------------------------------------------
# arch.make file for gfortran compiler.
# To use this arch.make file you should rename it to
#   arch.make
# or make a sym-link.
# For an explanation of the flags see DOCUMENTED-TEMPLATE.make

########################################################################################################################################
#UTILIZE ESTE ARCH.MAKE CASO ESTEJA TOMANDO COMO MODELO O ARCH.MAKE CORRETO PARA INSTALAÇÃO EM ALGUM OUTRO SISTEMA OPERACIONAL A PARTE.#
#                                                                                                                                      #
#REALIZE AS ALTERAÇÕES SOMENTE SE NÃO ESTIVER REALIZANDO A INSTALAÇÃO PELO SOFTWARE DE INTERFACE, POIS O MESMO CONSTROI AUTOMATICAMENTE#
#O ARCH.MAKE, COM EXCEÇÃO DE SISTEMAS ANTERIORES AO 17.04 DO UBUNTU.                                                                   #
########################################################################################################################################
.SUFFIXES:
.SUFFIXES: .f .F .o .c .a .f90 .F90

SIESTA_ARCH = SIESTA 4.1 - Linux 5.4.0-42-generic x86_64

CPP = gcc -E -P -x c
FPP = $(FC) -E -P -x c
FC = mpif90
FC_SERIAL = gfortran
#altere o diretorio "-L/usr/lib/x86_64-linux-gnu" para "-L/usr/lib/" SE FOR VERSÕES ANTERIORES A VERSÃO 17.04 DO UBUNTU
FFTW_LIBS = -L/usr/lib/x86_64-linux-gnu -lfftw3f -lfftw3
FFTW_INCFLAGS = -I/usr/include
#altere o diretorio PARA ONDE ESTA SENDO EFETUADA AS INSTLAÇÕES DAS BIBLIOTECAS
HDF5_LIBS = -L/home/brainiac/Documentos/Install_Use-Siesta-Transiesta-Inelastica-master/Install/PackageSIESTA/siesta-master/Docs/build/lib -lhdf5_hl -lhdf5 -lcurl
HDF5_INCFLAGS = -I/home/brainiac/Documentos/Install_Use-Siesta-Transiesta-Inelastica-master/Install/PackageSIESTA/siesta-master/Docs/build/include

WITH_MPI=1
WITH_NETCDF=1
WITH_NCDF=1
#altere o diretorio PARA ONDE ESTA SENDO EFETUADA AS INSTLAÇÕES DAS BIBLIOTECAS
NETCDF_LIBS = -L/home/brainiac/Documentos/Install_Use-Siesta-Transiesta-Inelastica-master/Install/PackageSIESTA/siesta-master/Docs/build/lib -lnetcdff -lnetcdf
NETCDF_INCFLAGS = -I/home/brainiac/Documentos/Install_Use-Siesta-Transiesta-Inelastica-master/Install/PackageSIESTA/siesta-master/Docs/build/include -lnetcdff -lnetcdf
#altere o diretorio PARA ONDE ESTA SENDO EFETUADA AS INSTLAÇÕES DAS BIBLIOTECAS
OTHER_LIBS = -L/home/brainiac/Documentos/Install_Use-Siesta-Transiesta-Inelastica-master/Install/PackageSIESTA/siesta-master/Docs/build/lib -lz

FFLAGS = -g -O2 $(INCFLAGS) $(NETCDF_INCFLAGS) $(FFTW_INCFLAGS) $(HDF5_INCFLAGS)

AR = ar
RANLIB = ranlib

SYS = nag

SP_KIND = 4
DP_KIND = 8
KINDS = $(SP_KIND) $(DP_KIND)

LDFLAGS =

COMP_LIBS = libncdf.a libfdict.a

BLAS_LIBS = -lblas
LAPACK_LIBS = -llapack
SCALAPACK_LIBS = /usr/lib/x86_64-linux-gnu/libscalapack-openmpi.so
#altere o diretorio "-L/usr/lib/x86_64-linux-gnu" para "-L/usr/lib/" SE FOR VERSÕES ANTERIORES A VERSÃO 17.04 DO UBUNTU
FPPFLAGS_CDF = -DNCDF -DNCDF_4 -DCDF

FPPFLAGS = $(FPPFLAGS_MPI) $(DEFS_PREFIX) $(FPPFLAGS_CDF) -DFC_HAVE_ABORT -DMPI -DFC_HAVE_FLUSH -DGFORTRAN -DGRID_DP -DPHI_GRID_SP -DUSE_GEMM3m

LIBS = $(SCALAPACK_LIBS) $(LAPACK_LIBS) $(INCFLAGS) $(NETCDF_LIBS) $(HDF5_LIBS) $(OTHER_LIBS) $(MPI_LIBS) -fopenmp

MPI_INTERFACE = libmpi_f90.a
MPI_INCLUDE = .

# Dependency rules ---------

FFLAGS_DEBUG = -g -O0   # your appropriate flags here...

# The atom.f code is very vulnerable. Particularly the Intel compiler
# will make an erroneous compilation of atom.f with high optimization
# levels.
atom.o: atom.F
	$(FC) -c $(FFLAGS_DEBUG) $(INCFLAGS) $(FPPFLAGS) $(FPPFLAGS_fixed_F) $< 

.c.o:
	$(CC) -c $(CFLAGS) $(INCFLAGS) $(CPPFLAGS) $< 
.F.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FPPFLAGS) $(FPPFLAGS_fixed_F)  $< 
.F90.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FPPFLAGS) $(FPPFLAGS_free_F90) $< 
.f.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FCFLAGS_fixed_f)  $<
.f90.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FCFLAGS_free_f90)  $<

