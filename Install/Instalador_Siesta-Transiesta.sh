#!/bin/bash

sudo su

Packages(){

clear
####INSTALATAÇÃO DE PACOTES INICIAIS PARA SIESTA/TRANSIESTA - ARQUITETURA AMD64####
echo '\033[05;33m####INSTALATAÇÃO DE PACOTES INICIAIS PARA SIESTA/TRANSIESTA - ARQUITETURA AMD64####\033[00;00m'

#### COMANDOS GERAIS #### 

#sh InstaladorSiesta.sh     /Iniciar a instalação completa do Siesta/Transiesta
#sudo dpkg -i NOME_DO_PACOTE.deb     /INSTALA PACOTES .deb
#sudo apt-get install -f        /reparar pacotes quebrados

###Atualização do repositorio e Atualização de pacotes para a versão mais recente####
echo "###Atualização do repositorio e Atualização de pacotes para a versão mais recente####\n\n"

# Removendo processos anteriores
echo "Removendo processos anteriores \n\n"
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/dpkg/lock-frontend
echo "\n\n"

#Ativando repositorio canoninal e adicionando repositorios
echo "ativando repositorio canoninal e adicionando repositorios\n\n"
sudo sed -i.bak "/^# deb .*partner/ s/^# //" /etc/apt/sources.list -y
echo "\n\n"

#Atualização de repositorios e bibliotecas
echo "Atualização de repositorios e bibliotecas\n\n"
sudo apt-get update -y  
sudo apt-get dist-upgrade -y
echo "\n\n"

# Instalando programas essenciais de instalação
echo "Instalando programas essenciais de instalação\n\n"
sudo apt install unzip -y
sudo apt-get install wget -y #instalando para baixar direito de sites
wget -c http://mirrors.kernel.org/ubuntu/pool/main/w/wget/wget_1.20.3-1ubuntu1_amd64.deb
sudo dpkg -i wget_1.20.3-1ubuntu1_amd64.deb

wget -c http://mirrors.kernel.org/ubuntu/pool/main/p/python3-stdlib-extensions/python3-tk_3.8.2-1ubuntu1_amd64.deb
sudo dpkg -i python3-tk_3.8.2-1ubuntu1_amd64.deb
sudo apt-get install python3 python3-tk -y #instalando Python 3
sudo apt install python3-pip -y #instalando pip-Python3/ Uso "sudo python3 -m pip"
echo "\n\n"

#####PACOTES A SEREM INSTALADOS####
echo "#####PACOTES A SEREM INSTALADOS####\n\n"

#PACOTE gfortran
echo "#PACOTE gfortran\n\n"
sudo apt-get install fort77 -y #77
sudo apt-get install gfortran -y #90/95
echo "\n\n"

#PACOTE GaussSum
echo "#PACOTE GaussSum\n\n"
sudo apt-get install gnuplot -y #instalando GNUplot
sudo apt-get install python3-numpy -y #instalando numpy
sudo python3 -m pip install cclib --upgrade -y #instalando cclib
sudo apt-get install gausssum -y
echo "\n\n"

#PACOTE m4
echo "#PACOTE m4"
wget -c http://ftp.us.debian.org/debian/pool/main/libs/libsigsegv/libsigsegv2_2.12-2_amd64.deb
sudo dpkg -i libsigsegv2_2.12-2_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/main/m/m4/m4_1.4.18-4_amd64.deb
sudo dpkg -i m4_1.4.18-4_amd64.deb
echo "\n\n"

#PACOTE bcc
echo "#PACOTE bcc\n\n"

##DEPENDENCIAS 
echo "##DEPENDENCIAS\n\n"
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/l/linux86/bin86_0.16.17-3.3_amd64.deb
sudo dpkg -i bin86_0.16.17-3.3_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/l/linux86/elks-libc_0.16.17-3.3_all.deb
sudo dpkg -i elks-libc_0.16.17-3.3_all.deb
wget -c http://launchpadlibrarian.net/464026778/libbpfcc_0.12.0-2_amd64.deb
sudo dpkg -i libbpfcc_0.12.0-2_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/b/bpfcc/python3-bpfcc_0.12.0-2_all.deb
sudo dpkg -i python3-bpfcc_0.12.0-2_all.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/main/i/ieee-data/ieee-data_20150531.1_all.deb
sudo dpkg -i ieee-data_20150531.1_all.deb
python3 -m pip install netaddr
wget -c https://github.com/netaddr/netaddr/archive/master.zip
unzip -o master.zip
cd netaddr-master
python3 setup.py install -y
cd ..
echo "\n\n"

###bcc
echo "###bcc\n\n"
sudo apt install bcc bpfcc-tools -y
echo "deb [trusted=yes] https://repo.iovisor.org/apt/bionic bionic-nightly main" | sudo tee /etc/apt/sources.list.d/iovisor.list
deb [trusted=yes] https://repo.iovisor.org/apt/bionic bionic-nightly main
echo "\n\n"

#PACOTE CCCC
echo "#PACOTE CCCC\n\n"
sudo apt-get install cccc -y
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/c/cccc/cccc_3.1.4-12_amd64.deb
sudo dpkg -i cccc_3.1.4-12_amd64.deb
echo "\n\n"

#PACOTE fcc
echo "#PACOTE fcc\n\n"
wget -c http://ubuntu.mirrors.tds.net/ubuntu/pool/universe/l/looptools/fcc_2.8-1build3_amd64.deb
sudo dpkg -i fcc_2.8-1build3_amd64.deb
echo "\n\n"

#PACOTE abinit
echo "#PACOTE abinit\n\n"
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/a/abinit/abinit_8.10.2-2_amd64.deb
sudo dpkg -i abinit_8.10.2-2_amd64.deb
echo "\n\n"

#PACOTE GPAW e suas dependencias
echo "#PACOTE GPAW e suas dependencias\n\n"

##DEPENDENCIA libfftw3-dev
echo "##DEPENDENCIA libfftw3-dev\n\n"
wget -c http://ftp.us.debian.org/debian/pool/main/f/fftw3/libfftw3-bin_3.3.8-2_amd64.deb
sudo dpkg -i libfftw3-bin_3.3.8-2_amd64.deb
wget -c http://ftp.us.debian.org/debian/pool/main/f/fftw3/libfftw3-single3_3.3.8-2_amd64.deb
sudo dpkg -i libfftw3-single3_3.3.8-2_amd64.deb
wget -c http://ftp.us.debian.org/debian/pool/main/f/fftw3/libfftw3-long3_3.3.8-2_amd64.deb
sudo dpkg -i libfftw3-long3_3.3.8-2_amd64.deb
wget -c http://ftp.us.debian.org/debian/pool/main/f/fftw3/libfftw3-double3_3.3.8-2_amd64.deb
sudo dpkg -i libfftw3-double3_3.3.8-2_amd64.deb
wget -c http://ftp.us.debian.org/debian/pool/main/f/fftw3/libfftw3-quad3_3.3.8-2_amd64.deb
sudo dpkg -i libfftw3-quad3_3.3.8-2_amd64.deb
wget -c http://ftp.us.debian.org/debian/pool/main/f/fftw3/libfftw3-dev_3.3.8-2_amd64.deb
sudo dpkg -i libfftw3-dev_3.3.8-2_amd64.deb
echo "\n\n"

##DEPENDENCIA openmpi-bin
echo "##DEPENDENCIA openmpi-bin\n\n"
wget -c http://mirrors.kernel.org/ubuntu/pool/main/r/rdma-core/librdmacm1_17.1-1_amd64.deb
sudo dpkg -i librdmacm1_17.1-1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/libf/libfabric/libfabric1_1.5.3-1_amd64.deb
sudo dpkg -i libfabric1_1.5.3-1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hwloc/libhwloc5_1.11.9-1_amd64.deb
sudo dpkg -i libhwloc5_1.11.9-1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/main/r/rdma-core/libibverbs1_28.0-1ubuntu1_amd64.deb
sudo dpkg -i libibverbs1_28.0-1ubuntu1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/main/r/rdma-core/libibverbs-dev_28.0-1ubuntu1_amd64.deb
sudo dpkg -i libibverbs-dev_28.0-1ubuntu1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/i/infinipath-psm/libpsm-infinipath1_3.3+20.604758e7-5_amd64.deb
sudo dpkg -i libpsm-infinipath1_3.3+20.604758e7-5_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/main/o/ocl-icd/ocl-icd-libopencl1_2.2.11-1ubuntu1_amd64.deb
sudo dpkg -i ocl-icd-libopencl1_2.2.11-1ubuntu1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hwloc/libhwloc-plugins_1.11.9-1_amd64.deb
sudo dpkg -i libhwloc-plugins_1.11.9-1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/libf/libfabric/libfabric1_1.5.3-1_amd64.deb
sudo dpkg -i libfabric1_1.5.3-1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/o/openmpi/libopenmpi2_2.1.1-8_amd64.deb
sudo dpkg -i libopenmpi2_2.1.1-8_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/o/openmpi/openmpi-common_4.0.3-0ubuntu1_all.deb
sudo dpkg -i openmpi-common_4.0.3-0ubuntu1_all.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/o/openmpi/openmpi-bin_4.0.3-0ubuntu1_amd64.deb
sudo dpkg -i openmpi-bin_4.0.3-0ubuntu1_amd64.deb
echo "\n\n"

##DEPENDENCIA libopenmpi3
echo "##DEPENDENCIA libopenmpi3\n\n"
wget -c http://mirrors.kernel.org/ubuntu/pool/main/libe/libevent/libevent-2.1-7_2.1.11-stable-1_amd64.deb
sudo dpkg -i libevent-2.1-7_2.1.11-stable-1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/main/libe/libevent/libevent-core-2.1-7_2.1.11-stable-1_amd64.deb
sudo dpkg -i libevent-core-2.1-7_2.1.11-stable-1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/main/libe/libevent/libevent-pthreads-2.1-7_2.1.11-stable-1_amd64.deb
sudo dpkg -i libevent-pthreads-2.1-7_2.1.11-stable-1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/p/pmix/libpmix2_3.1.5-1_amd64.deb
sudo dpkg -i libpmix2_3.1.5-1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/libp/libpsm2/libpsm2-2_11.2.86-1_amd64.deb
sudo dpkg -i libpsm2-2_11.2.86-1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hwloc/libhwloc15_2.1.0+dfsg-4_amd64.deb
sudo dpkg -i libhwloc15_2.1.0+dfsg-4_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/o/openmpi/libopenmpi3_4.0.3-0ubuntu1_amd64.deb
sudo dpkg -i libopenmpi3_4.0.3-0ubuntu1_amd64.deb libopenmpi3_4.0.3-0ubuntu1_amd64.deb
echo "\n\n"

##DEPEDENCIA libxc5
echo "##DEPEDENCIA libxc5\n\n"
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/libx/libxc/libxc5_4.3.4-1build1_amd64.deb
sudo dpkg -i libxc5_4.3.4-1build1_amd64.deb
echo "\n\n"

##DEPENDENCIA PYTHON3
echo "##DEPENDENCIA PYTHON3\n\n"
wget -c http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/libpython3.8-minimal_3.8.2-1ubuntu1.1_amd64.deb
sudo dpkg -i libpython3.8-minimal_3.8.2-1ubuntu1.1_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/main/p/python3.8/python3.8-minimal_3.8.2-1ubuntu1.1_amd64.deb
sudo dpkg -i python3.8-minimal_3.8.2-1ubuntu1.1_amd64.deb
wget -c http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/python3.8_3.8.2-1ubuntu1.1_amd64.deb
sudo dpkg -i python3.8_3.8.2-1ubuntu1.1_amd64.deb
wget -c http://ftp.us.debian.org/debian/pool/main/p/python3-defaults/python3-minimal_3.8.2-3_amd64.deb
sudo dpkg -i python3-minimal_3.8.2-3_amd64.deb
wget -c http://ftp.us.debian.org/debian/pool/main/p/python3-defaults/libpython3-stdlib_3.8.2-3_amd64.deb
sudo dpkg -i libpython3-stdlib_3.8.2-3_amd64.deb
wget -c http://ftp.us.debian.org/debian/pool/main/p/python3-defaults/python3_3.8.2-3_amd64.deb
sudo dpkg -i python3_3.8.2-3_amd64.deb
wget -c http://ftp.us.debian.org/debian/pool/main/p/python3-defaults/libpython3-dev_3.8.2-3_amd64.deb
sudo dpkg -i libpython3-dev_3.8.2-3_amd64.deb
wget -c http://ftp.us.debian.org/debian/pool/main/p/python3-defaults/python3-dev_3.8.2-3_amd64.deb
sudo dpkg -i python3-dev_3.8.2-3_amd64.deb
sudo apt install libopenblas-dev libxc-dev libscalapack-mpi-dev -y
sudo apt-get install python3-matplotlib -y
wget -c http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-font-awesome/fonts-font-awesome_5.0.10+really4.7.0~dfsg-1_all.deb
sudo dpkg -i fonts-font-awesome_5.0.10+really4.7.0~dfsg-1_all.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/t/twitter-bootstrap3/fonts-glyphicons-halflings_1.009~3.4.1+dfsg-1_all.deb
sudo dpkg -i fonts-glyphicons-halflings_1.009~3.4.1+dfsg-1_all.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/t/twitter-bootstrap3/libjs-bootstrap_3.4.1+dfsg-1_all.deb
sudo dpkg -i libjs-bootstrap_3.4.1+dfsg-1_all.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/s/spglib/python3-spglib_1.14.1-5build2_amd64.deb
sudo dpkg -i python3-spglib_1.14.1-5build2_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/p/python-ase/python3-ase_3.19.0-1_all.deb
sudo dpkg -i python3-ase_3.19.0-1_all.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/c/cftime/python3-cftime_1.1.0+ds-1build1_amd64.deb
sudo dpkg -i python3-cftime_1.1.0+ds-1build1_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/n/netcdf/libnetcdf15_4.7.3-1_amd64.deb
sudo dpkg -i libnetcdf15_4.7.3-1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/n/netcdf4-python/python3-netcdf4_1.5.3-1build2_amd64.deb
sudo dpkg -i python3-netcdf4_1.5.3-1build2_amd64.deb
sudo apt-get install libnetcdf-dev libnetcdff-dev -y
wget -c http://mirrors.kernel.org/ubuntu/pool/main/p/python-decorator/python3-decorator_4.4.2-0ubuntu1_all.deb
sudo dpkg -i python3-decorator_4.4.2-0ubuntu1_all.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/l/lbfgsb/liblbfgsb0_3.0+dfsg.3-7build1_amd64.deb
sudo dpkg -i liblbfgsb0_3.0+dfsg.3-7build1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/s/scipy/python3-scipy_1.3.3-3build1_amd64.deb
sudo dpkg -i python3-scipy_1.3.3-3build1_amd64.deb
echo "\n\n"

###GPAW
echo "###GPAW\n\n"
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gpaw-setups/gpaw-data_0.9.20000-2_all.deb
sudo dpkg -i gpaw-data_0.9.20000-2_all.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gpaw/gpaw_20.1.0-2build1_amd64.deb
sudo dpkg -i gpaw_20.1.0-2build1_amd64.deb
python3 -m pip install --upgrade --user numpy scipy matplotlib -y
echo "\n\n"

#PACOTE quantum-espresso
echo "#PACOTE quantum-espresso\n\n"

##DEPENDENCIAS
echo "##DEPENDENCIAS\n\n"
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/e/elpa/libelpa4_2016.05.001-6build1_amd64.deb
sudo dpkg -i libelpa4_2016.05.001-6build1_amd64.deb
wget -c http://security.ubuntu.com/ubuntu/pool/main/g/gcc-7/gcc-7-base_7.5.0-3ubuntu1~18.04_amd64.deb
sudo dpkg -i gcc-7-base_7.5.0-3ubuntu1~18.04_amd64.deb
wget -c http://security.ubuntu.com/ubuntu/pool/main/g/gcc-7/libgfortran4_7.5.0-3ubuntu1~18.04_amd64.deb
sudo dpkg -i libgfortran4_7.5.0-3ubuntu1~18.04_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/m/mpi-defaults/mpi-default-bin_1.10_amd64.deb
sudo dpkg -i mpi-default-bin_1.10_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/s/scalapack/libscalapack-openmpi2.0_2.0.2-4_amd64.deb
sudo dpkg -i libscalapack-openmpi2.0_2.0.2-4_amd64.deb
echo "\n\n"

###quantum-espresso
echo "###quantum-espresso\n\n"
wget -c http://ftp.us.debian.org/debian/pool/main/e/espresso/quantum-espresso_6.3-4_amd64.deb
sudo dpkg -i quantum-espresso_6.3-4_amd64.deb
wget -c http://ftp.us.debian.org/debian/pool/main/e/espresso/quantum-espresso-data_6.3-4_all.deb
sudo dpkg -i quantum-espresso-data_6.3-4_all.deb
echo "\n\n"

#PACOTE meep-lam4
echo "#PACOTE meep-lam4\n\n"

##DEPENDENCIAS
echo "##DEPENDENCIAS\n\n"
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/libc/libctl/libctl7_4.4.0-3_amd64.deb
sudo dpkg -i libctl7_4.4.0-3_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/l/lam/liblam4_7.1.4-6build1_amd64.deb
sudo dpkg -i liblam4_7.1.4-6build1_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/a/atlas/libatlas3-base_3.10.3-8ubuntu7_amd64.deb
sudo dpkg -i libatlas3-base_3.10.3-8ubuntu7_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gsl/libgslcblas0_2.5+dfsg-6_amd64.deb
sudo dpkg -i libgslcblas0_2.5+dfsg-6_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gsl/libgsl23_2.5+dfsg-6_amd64.deb
sudo dpkg -i libgsl23_2.5+dfsg-6_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/harminv/libharminv3_1.4.1-2_amd64.deb
sudo dpkg -i libharminv3_1.4.1-2_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/liba/libaec/libaec0_1.0.4-1_amd64.deb
sudo dpkg -i libaec0_1.0.4-1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/liba/libaec/libsz2_1.0.4-1_amd64.deb
sudo dpkg -i libsz2_1.0.4-1_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/h/hdf5/libhdf5-103_1.10.4+repack-11ubuntu1_amd64.deb
sudo dpkg -i libhdf5-103_1.10.4+repack-11ubuntu1_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/m/meep-lam4/libmeep-lam4-12_1.7.0-3_amd64.deb
sudo dpkg -i libmeep-lam4-12_1.7.0-3_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/main/o/openssh/openssh-client_8.2p1-4_amd64.deb
sudo dpkg -i openssh-client_8.2p1-4_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/main/o/openssh/openssh-sftp-server_8.2p1-4_amd64.deb
sudo dpkg -i openssh-sftp-server_8.2p1-4_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/main/o/openssh/openssh-server_8.2p1-4_amd64.deb
sudo dpkg -i openssh-server_8.2p1-4_amd64.deb
wget -c http://mirrors.kernel.org/ubuntu/pool/universe/l/lam/lam-runtime_7.1.4-6build1_amd64.deb
sudo dpkg -i lam-runtime_7.1.4-6build1_amd64.deb
echo "\n\n"

###meep-lam4
echo "###meep-lam4\n\n"
sudo apt-get install libblas-dev liblapack-dev -y
sudo apt-get install guile-3.0 -y
sudo apt-get install mpich -y
sudo apt-get install libhdf5-serial-dev -y
sudo apt-get install hdf5-tools -y
sudo apt-get install libatlas-base-dev -y
sudo apt install libatlas-ecmwf-utils -y
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/m/meep-lam4/meep-lam4_1.7.0-3_amd64.deb
sudo dpkg -i meep-lam4_1.7.0-3_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/m/meep/meep_1.12.0-2build2_amd64.deb
sudo dpkg -i meep_1.12.0-2build2_amd64.deb
echo "\n\n"

#Reatualização de repositorios e bibliotecas
echo "Reatualização de repositorios e bibliotecas\n\n"
sudo apt-get update -y  
sudo apt-get dist-upgrade -y
echo "\n\n"

cd ..
}

####INICIANDO SISTEMA####
echo  '\033[05;37m####                              INICIANDO SISTEMA####\033[00;00m\n\n'
sleep 3

while :
do
    clear
    echo -e '\033[05;37m####                       ESCOLHA A OPÇÃO####\033[00;00m
    \n\033[01;36m 1 - INSTALAR OS PACOTES INICIAIS PARA SIESTA/TRANSIESTA\033[00;00m
    \n\033[01;32m 2 - INSTALAR SIESTA/TRANSIESTA\033[00;00m
    \n\033[01;31m 3 - EXIT\033[00;00m
    \n\nDIGITE A NUMERAÇÃO: '

    read input
    case $input in

    1) if [ -e "DownloadPackage" ]; then
         echo 'O DIRETÓRIO \033[32mDownloadPackage"\033[00m EXISTE
        \n\n MUDANDO O DIRETÓRIO ATUAL PARA: \033[05;33m"DownloadPackage"\033[00;00m\n\n'
        sleep 2
        cd DownloadPackage
        Packages

        else
         echo 'O DIRETÓRIO \033[32m"DownloadPackage"\033[00m NÃO EXISTE
        \n\n CRIANDO O DIRETÓRIO: \033[05;33m"DownloadPackage"\033[00;00m\n\n'
        mkdir DownloadPackage
        cd DownloadPackage
        sleep 2
        Packages
        fi ;; 
    2) ;;

    3) exit;;

    *) echo "Opcao Invalida!" ;; 
    esac
done

