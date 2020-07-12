#!/bin/bash

####INSTALATAÇÃO SIESTA/TRANSIESTA - ARQUITETURA AMD64####
echo -e "\033[05;33m####INSTALATAÇÃO SIESTA/TRANSIESTA - ARQUITETURA AMD64####\033[05;33m"
#### COMANDOS GERAIS #### 

#sh InstaladorSiesta.sh     /Iniciar a instalação completa do Siesta/Transiesta
#sudo dpkg -i NOME_DO_PACOTE.deb     /INSTALA PACOTES .deb
#sudo apt-get install -f        /reparar pacotes quebrados

###Atualização do repositorio e Atualização de pacotes para a versão mais recente####
echo -e "###Atualização do repositorio e Atualização de pacotes para a versão mais recente####\n\n"

# Removendo processos anteriores
echo -e "Removendo processos anteriores \n\n"
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/dpkg/lock-frontend
echo -e "\n\n"

#Ativando repositorio canoninal e adicionando repositorios
echo -e "ativando repositorio canoninal e adicionando repositorios\n\n"
sudo sed -i.bak "/^# deb .*partner/ s/^# //" /etc/apt/sources.list -y
echo -e "\n\n"

#Atualização de repositorios e bibliotecas
echo -e "Atualização de repositorios e bibliotecas\n\n"
sudo apt-get update -y  
sudo apt-get dist-upgrade -y
echo -e "\n\n"

# Instalando programas essenciais de instalação
echo -e "Instalando programas essenciais de instalação\n\n"
sudo apt-get install wget -y #instalando para baixar direito de sites
sudo apt-get install python3 python3-tk -y #instalando Python 3
sudo apt install python3-pip -y #instalando pip-Python3/ Uso "sudo python3 -m pip"
echo -e "\n\n"

#####PACOTES A SEREM INSTALADOS####
echo -e "#####PACOTES A SEREM INSTALADOS####\n\n"

#PACOTE gfortran
echo -e "#PACOTE gfortran\n\n"
sudo apt-get install fort77 -y #77
sudo apt-get install gfortran -y #90/95
echo -e "\n\n"

#PACOTE GaussSum
echo -e "#PACOTE GaussSum\n\n"
sudo apt-get install gnuplot -y #instalando GNUplot
sudo apt-get install python3-numpy -y #instalando numpy
sudo python3 -m pip install cclib --upgrade -y #instalando cclib
sudo apt-get install gausssum -y
echo -e "\n\n"

#PACOTE m4
echo -e "#PACOTE m4"
wget http://ftp.us.debian.org/debian/pool/main/libs/libsigsegv/libsigsegv2_2.12-2_amd64.deb
sudo dpkg -i libsigsegv2_2.12-2_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/m/m4/m4_1.4.18-4_amd64.deb
sudo dpkg -i m4_1.4.18-4_amd64.deb
echo -e "\n\n"

#PACOTE bcc
echo -e "#PACOTE bcc\n\n"

##DEPENDENCIAS 
echo -e "##DEPENDENCIAS\n\n"
wget http://archive.ubuntu.com/ubuntu/pool/universe/l/linux86/bin86_0.16.17-3.3_amd64.deb
sudo dpkg -i bin86_0.16.17-3.3_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/l/linux86/elks-libc_0.16.17-3.3_all.deb
sudo dpkg -i elks-libc_0.16.17-3.3_all.deb
wget http://launchpadlibrarian.net/464026778/libbpfcc_0.12.0-2_amd64.deb
sudo dpkg -i libbpfcc_0.12.0-2_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/b/bpfcc/python3-bpfcc_0.12.0-2_all.deb
sudo dpkg -i python3-bpfcc_0.12.0-2_all.deb
wget http://mirrors.kernel.org/ubuntu/pool/main/i/ieee-data/ieee-data_20150531.1_all.deb
sudo dpkg -i ieee-data_20150531.1_all.deb
python3 -m pip install netaddr
wget http://mirrors.kernel.org/ubuntu/pool/main/p/python-netaddr/python3-netaddr_0.7.19-1_all.deb
sudo dpkg -i python3-netaddr_0.7.19-1_all.deb
echo -e "\n\n"

###bcc
echo -e "###bcc\n\n"
sudo apt install bcc bpfcc-tools -y
echo "deb [trusted=yes] https://repo.iovisor.org/apt/bionic bionic-nightly main" | sudo tee /etc/apt/sources.list.d/iovisor.list
deb [trusted=yes] https://repo.iovisor.org/apt/bionic bionic-nightly main
echo -e "\n\n"

#PACOTE CCCC
echo -e "#PACOTE CCCC\n\n"
sudo apt-get install cccc -y
wget http://archive.ubuntu.com/ubuntu/pool/universe/c/cccc/cccc_3.1.4-12_amd64.deb
sudo dpkg -i cccc_3.1.4-12_amd64.deb
echo -e "\n\n"

#PACOTE fcc
echo -e "#PACOTE fcc\n\n"
wget http://ubuntu.mirrors.tds.net/ubuntu/pool/universe/l/looptools/fcc_2.8-1build3_amd64.deb
sudo dpkg -i fcc_2.8-1build3_amd64.deb
echo -e "\n\n"

#PACOTE abinit
echo -e "#PACOTE abinit\n\n"
wget http://archive.ubuntu.com/ubuntu/pool/universe/a/abinit/abinit_8.10.2-2_amd64.deb
sudo dpkg -i abinit_8.10.2-2_amd64.deb
echo -e "\n\n"

#PACOTE GPAW e suas dependencias
echo -e "#PACOTE GPAW e suas dependencias\n\n"

##DEPENDENCIA libfftw3-dev
echo -e "##DEPENDENCIA libfftw3-dev\n\n"
wget http://mirrors.kernel.org/ubuntu/pool/main/f/fftw3/libfftw3-bin_3.3.7-1_amd64.deb
sudo dpkg -i libfftw3-bin_3.3.7-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/f/fftw3/libfftw3-single3_3.3.7-1_amd64.deb
sudo dpkg -i libfftw3-single3_3.3.7-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/main/f/fftw3/libfftw3-long3_3.3.7-1_amd64.deb
sudo dpkg -i libfftw3-long3_3.3.7-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/main/f/fftw3/libfftw3-double3_3.3.7-1_amd64.deb
sudo dpkg -i libfftw3-double3_3.3.7-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/main/f/fftw3/libfftw3-quad3_3.3.7-1_amd64.deb
sudo dpkg -i libfftw3-quad3_3.3.7-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/f/fftw3/libfftw3-dev_3.3.7-1_amd64.deb
sudo dpkg -i libfftw3-dev_3.3.7-1_amd64.deb
echo -e "\n\n"

##DEPENDENCIA openmpi-bin
echo -e "##DEPENDENCIA openmpi-bin\n\n"
wget http://mirrors.kernel.org/ubuntu/pool/main/r/rdma-core/librdmacm1_17.1-1_amd64.deb
sudo dpkg -i librdmacm1_17.1-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/libf/libfabric/libfabric1_1.5.3-1_amd64.deb
sudo dpkg -i libfabric1_1.5.3-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/h/hwloc/libhwloc5_1.11.9-1_amd64.deb
sudo dpkg -i libhwloc5_1.11.9-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/main/r/rdma-core/libibverbs1_17.1-1_amd64.deb
sudo dpkg -i libibverbs1_17.1-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/i/infinipath-psm/libpsm-infinipath1_3.3+20.604758e7-5_amd64.deb
sudo dpkg -i libpsm-infinipath1_3.3+20.604758e7-5_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/main/o/ocl-icd/ocl-icd-libopencl1_2.2.11-1ubuntu1_amd64.deb
sudo dpkg -i ocl-icd-libopencl1_2.2.11-1ubuntu1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/h/hwloc/libhwloc-plugins_1.11.9-1_amd64.deb
sudo dpkg -i libhwloc-plugins_1.11.9-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/libf/libfabric/libfabric1_1.5.3-1_amd64.deb
sudo dpkg -i libfabric1_1.5.3-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/o/openmpi/libopenmpi2_2.1.1-8_amd64.deb
sudo dpkg -i libopenmpi2_2.1.1-8_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/o/openmpi/openmpi-common_2.1.1-8_all.deb
sudo dpkg -i openmpi-common_2.1.1-8_all.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/o/openmpi/openmpi-bin_2.1.1-8_amd64.deb
sudo dpkg -i openmpi-bin_2.1.1-8_amd64.deb
echo -e "\n\n"

##DEPENDENCIA libopenmpi3
echo -e "##DEPENDENCIA libopenmpi3\n\n"
wget http://mirrors.kernel.org/ubuntu/pool/main/libe/libevent/libevent-2.1-7_2.1.11-stable-1_amd64.deb
sudo dpkg -i libevent-2.1-7_2.1.11-stable-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/main/libe/libevent/libevent-core-2.1-7_2.1.11-stable-1_amd64.deb
sudo dpkg -i libevent-core-2.1-7_2.1.11-stable-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/main/libe/libevent/libevent-pthreads-2.1-7_2.1.11-stable-1_amd64.deb
sudo dpkg -i libevent-pthreads-2.1-7_2.1.11-stable-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/p/pmix/libpmix2_3.1.5-1_amd64.deb
sudo dpkg -i libpmix2_3.1.5-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/libp/libpsm2/libpsm2-2_11.2.86-1_amd64.deb
sudo dpkg -i libpsm2-2_11.2.86-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/h/hwloc/libhwloc15_2.1.0+dfsg-4_amd64.deb
sudo dpkg -i libhwloc15_2.1.0+dfsg-4_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/o/openmpi/libopenmpi3_4.0.3-0ubuntu1_amd64.deb
sudo dpkg -i libopenmpi3_4.0.3-0ubuntu1_amd64.deb libopenmpi3_4.0.3-0ubuntu1_amd64.deb
echo -e "\n\n"

##DEPEDENCIA libxc5
echo -e "##DEPEDENCIA libxc5\n\n"
wget http://mirrors.kernel.org/ubuntu/pool/universe/libx/libxc/libxc5_4.3.4-1build1_amd64.deb
sudo dpkg -i libxc5_4.3.4-1build1_amd64.deb

##DEPENDENCIA PYTHON3
echo -e "##DEPENDENCIA PYTHON3\n\n"
sudo apt install python3-dev libopenblas-dev libxc-dev libscalapack-mpi-dev libfftw3-dev -y
sudo apt-get install python3-matplotlib -y
wget http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-font-awesome/fonts-font-awesome_5.0.10+really4.7.0~dfsg-1_all.deb
sudo dpkg -i fonts-font-awesome_5.0.10+really4.7.0~dfsg-1_all.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/t/twitter-bootstrap3/fonts-glyphicons-halflings_1.009~3.4.1+dfsg-1_all.deb
sudo dpkg -i fonts-glyphicons-halflings_1.009~3.4.1+dfsg-1_all.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/t/twitter-bootstrap3/libjs-bootstrap_3.4.1+dfsg-1_all.deb
sudo dpkg -i libjs-bootstrap_3.4.1+dfsg-1_all.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/s/spglib/python3-spglib_1.14.1-5build2_amd64.deb
sudo dpkg -i python3-spglib_1.14.1-5build2_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/p/python-ase/python3-ase_3.19.0-1_all.deb
sudo dpkg -i python3-ase_3.19.0-1_all.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/c/cftime/python3-cftime_1.1.0+ds-1build1_amd64.deb
sudo dpkg -i python3-cftime_1.1.0+ds-1build1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/n/netcdf/libnetcdf15_4.7.3-1_amd64.deb
sudo dpkg -i libnetcdf15_4.7.3-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/n/netcdf4-python/python3-netcdf4_1.5.3-1build2_amd64.deb
sudo dpkg -i python3-netcdf4_1.5.3-1build2_amd64.deb
sudo apt-get install libnetcdf-dev libnetcdff-dev -y
wget http://mirrors.kernel.org/ubuntu/pool/main/p/python-decorator/python3-decorator_4.4.2-0ubuntu1_all.deb
sudo dpkg -i python3-decorator_4.4.2-0ubuntu1_all.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/l/lbfgsb/liblbfgsb0_3.0+dfsg.3-7build1_amd64.deb
sudo dpkg -i liblbfgsb0_3.0+dfsg.3-7build1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/s/scipy/python3-scipy_1.3.3-3build1_amd64.deb
sudo dpkg -i python3-scipy_1.3.3-3build1_amd64.deb
echo -e "\n\n"

###GPAW
echo -e "###GPAW\n\n"
wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gpaw-setups/gpaw-data_0.9.20000-2_all.deb
sudo dpkg -i gpaw-data_0.9.20000-2_all.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gpaw/gpaw_20.1.0-2build1_amd64.deb
sudo dpkg -i gpaw_20.1.0-2build1_amd64.deb
python3 -m pip install --upgrade --user numpy scipy matplotlib -y
echo -e "\n\n"

#PACOTE quantum-espresso
echo -e "#PACOTE quantum-espresso\n\n"

##DEPENDENCIAS
echo -e "##DEPENDENCIAS\n\n"
wget http://mirrors.kernel.org/ubuntu/pool/universe/e/elpa/libelpa4_2016.05.001-6build1_amd64.deb
sudo dpkg -i libelpa4_2016.05.001-6build1_amd64.deb
wget http://security.ubuntu.com/ubuntu/pool/main/g/gcc-7/gcc-7-base_7.5.0-3ubuntu1~18.04_amd64.deb
sudo dpkg -i gcc-7-base_7.5.0-3ubuntu1~18.04_amd64.deb
wget http://security.ubuntu.com/ubuntu/pool/main/g/gcc-7/libgfortran4_7.5.0-3ubuntu1~18.04_amd64.deb
sudo dpkg -i libgfortran4_7.5.0-3ubuntu1~18.04_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/m/mpi-defaults/mpi-default-bin_1.10_amd64.deb
sudo dpkg -i mpi-default-bin_1.10_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/s/scalapack/libscalapack-openmpi2.0_2.0.2-4_amd64.deb
sudo dpkg -i libscalapack-openmpi2.0_2.0.2-4_amd64.deb
echo -e "\n\n"

###quantum-espresso
echo -e "###quantum-espresso\n\n"
wget http://ftp.us.debian.org/debian/pool/main/e/espresso/quantum-espresso_6.3-4_amd64.deb
sudo dpkg -i quantum-espresso_6.3-4_amd64.deb
wget http://ftp.us.debian.org/debian/pool/main/e/espresso/quantum-espresso-data_6.3-4_all.deb
sudo dpkg -i quantum-espresso-data_6.3-4_all.deb
echo -e "\n\n"

#PACOTE meep-lam4
echo -e "#PACOTE meep-lam4\n\n"

##DEPENDENCIAS
echo -e "##DEPENDENCIAS\n\n"
wget http://mirrors.kernel.org/ubuntu/pool/universe/libc/libctl/libctl7_4.4.0-3_amd64.deb
sudo dpkg -i libctl7_4.4.0-3_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/o/openmpi/openmpi-common_4.0.3-0ubuntu1_all.deb
sudo dpkg -i openmpi-common_4.0.3-0ubuntu1_all.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/o/openmpi/openmpi-bin_4.0.3-0ubuntu1_amd64.deb
sudo dpkg -i openmpi-bin_4.0.3-0ubuntu1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/l/lam/liblam4_7.1.4-6build1_amd64.deb
sudo dpkg -i liblam4_7.1.4-6build1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/a/atlas/libatlas3-base_3.10.3-8ubuntu5_amd64.deb
sudo dpkg -i libatlas3-base_3.10.3-8ubuntu5_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gsl/libgslcblas0_2.5+dfsg-6_amd64.deb
sudo dpkg -i libgslcblas0_2.5+dfsg-6_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gsl/libgsl23_2.5+dfsg-6_amd64.deb
sudo dpkg -i libgsl23_2.5+dfsg-6_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/h/harminv/libharminv3_1.4.1-2_amd64.deb
sudo dpkg -i libharminv3_1.4.1-2_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/liba/libaec/libaec0_1.0.4-1_amd64.deb
sudo dpkg -i libaec0_1.0.4-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/liba/libaec/libsz2_1.0.4-1_amd64.deb
sudo dpkg -i libsz2_1.0.4-1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/h/hdf5/libhdf5-103_1.10.4+repack-10_amd64.deb
sudo dpkg -i libhdf5-103_1.10.4+repack-10_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/m/meep-lam4/libmeep-lam4-12_1.7.0-3_amd64.deb
sudo dpkg -i libmeep-lam4-12_1.7.0-3_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/main/o/openssh/openssh-client_8.2p1-4_amd64.deb
sudo dpkg -i openssh-client_8.2p1-4_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/main/o/openssh/openssh-sftp-server_8.2p1-4_amd64.deb
sudo dpkg -i openssh-sftp-server_8.2p1-4_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/main/o/openssh/openssh-server_8.2p1-4_amd64.deb
sudo dpkg -i openssh-server_8.2p1-4_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/l/lam/lam-runtime_7.1.4-6build1_amd64.deb
sudo dpkg -i lam-runtime_7.1.4-6build1_amd64.deb
echo -e "\n\n"

###meep-lam4
echo -e "###meep-lam4\n\n"
sudo apt-get install libblas-dev liblapack-dev libopenblas-dev -y
sudo apt-get install guile-3.0 -y
sudo apt-get install mpich -y
sudo apt-get install libhdf5-serial-dev -y
sudo apt-get install hdf5-tools -y
sudo apt-get install meep h5utils -y
sudo apt-get install libatlas-base-dev -y
sudo apt install libatlas-ecmwf-utils -y
wget http://archive.ubuntu.com/ubuntu/pool/universe/m/meep-lam4/meep-lam4_1.7.0-3_amd64.deb
sudo dpkg -i meep-lam4_1.7.0-3_amd64.deb
echo -e "\n\n"

#Reatualização de repositorios e bibliotecas
echo -e "Reatualização de repositorios e bibliotecas\n\n"
sudo apt-get update -y  
sudo apt-get dist-upgrade -y
echo -e "\n\n"