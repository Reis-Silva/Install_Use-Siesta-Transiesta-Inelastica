#!/bin/bash

#### COMANDOS GERAIS ####

#sh InstaladorSiesta.sh     /Iniciar a instalação completa do Siesta/Transiesta
#sudo dpkg -i NOME_DO_PACOTE.deb     /INSTALA PACOTES .deb
#sudo apt-get install -f        /reparar pacotes quebrados

###Atualização do repositorio e Atualização de pacotes para a versão mais recente###

# removendo processos anteriores
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/dpkg/lock-frontend

#ativando repositorio canoninal e adicionando repositorios
sudo sed -i.bak "/^# deb .*partner/ s/^# //" /etc/apt/sources.list 

# instalando programas essenciais de instalação
sudo apt-get install wget -y #instalando para baixar direito de sites
sudo apt-get install python3 python3-tk -y #instalando Python 3
sudo apt install python3-pip -y #instalando pip-Python3/ Uso "sudo python3 -m pip"

#Atualização de repositorios e bibliotecas
sudo apt-get update -y  
sudo apt-get dist-upgrade -y

#############PACOTES A SEREM INSTALADOS############


#PACOTE gfortran
sudo apt-get install fort77 -y #77
sudo apt-get install gfortran -y #90/95

#PACOTE GaussSum e seus requerimentos#
sudo apt-get install gnuplot -y #instalando GNUplot
sudo apt-get install python3-numpy -y #instalando numpy
sudo python3 -m pip install cclib --upgrade  #instalando cclib
sudo apt-get install gausssum -y

#PACOTE m4#
wget http://archive.ubuntu.com/ubuntu/pool/main/m/m4/m4_1.4.18-4_amd64.deb
sudo dpkg -i m4_1.4.18-4_amd64.deb

#PACOTE bcc
sudo apt install bcc bpfcc-tools -y
echo "deb [trusted=yes] https://repo.iovisor.org/apt/bionic bionic-nightly main" | sudo tee /etc/apt/sources.list.d/iovisor.list
deb [trusted=yes] https://repo.iovisor.org/apt/bionic bionic-nightly main

#PACOTE CCCC
sudo apt-get install cccc -y
wget http://archive.ubuntu.com/ubuntu/pool/universe/c/cccc/cccc_3.1.4-12_amd64.deb
sudo dpkg -i cccc_3.1.4-12_amd64.deb

#PACOTE fcc
wget http://ubuntu.mirrors.tds.net/ubuntu/pool/universe/l/looptools/fcc_2.8-1build3_amd64.deb
sudo dpkg -i fcc_2.8-1build3_amd64.deb

#PACOTE abinit#
wget http://archive.ubuntu.com/ubuntu/pool/universe/a/abinit/abinit_8.10.2-2_amd64.deb
sudo dpkg -i abinit_8.10.2-2_amd64.deb

#PACOTE GPAW
sudo apt install python3-dev libopenblas-dev libxc-dev libscalapack-mpi-dev libfftw3-dev -y
sudo apt-get install python3-matplotlib -y
wget http://mirrors.kernel.org/ubuntu/pool/universe/p/python-ase/python3-ase_3.19.0-1_all.deb
sudo dpkg -i python3-ase_3.19.0-1_all.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/n/netcdf4-python/python3-netcdf4_1.5.3-1build2_amd64.deb
sudo dpkg -i python3-netcdf4_1.5.3-1build2_amd64.deb
sudo apt-get install libnetcdf-dev libnetcdff-dev -y
wget http://mirrors.kernel.org/ubuntu/pool/universe/s/scipy/python3-scipy_1.3.3-3build1_amd64.deb
sudo dpkg -i python3-scipy_1.3.3-3build1_amd64.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gpaw-setups/gpaw-data_0.9.20000-2_all.deb
sudo dpkg -i gpaw-data_0.9.20000-2_all.deb
wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gpaw/gpaw_20.1.0-2build1_amd64.deb
sudo dpkg -i gpaw_20.1.0-2build1_amd64.deb
python3 -m pip install --upgrade --user numpy scipy matplotlib -y

#PACOTE quantum-espresso
wget http://ftp.us.debian.org/debian/pool/main/e/espresso/quantum-espresso_6.3-4_amd64.deb
sudo dpkg -i quantum-espresso_6.3-4_amd64.deb
wget http://ftp.us.debian.org/debian/pool/main/e/espresso/quantum-espresso-data_6.3-4_all.deb
sudo dpkg -i quantum-espresso-data_6.3-4_all.deb

#PACOTE meep-lam4#  amd64
sudo apt-get install libblas-dev liblapack-dev libopenblas-dev -y
sudo apt-get install guile-3.0 -y
sudo apt-get install mpich -y
Sudo apt-get install libhdf5-serial-dev -y
sudo apt-get install hdf5-tools -y
sudo apt-get install meep h5utils -y
sudo apt-get install libatlas-base-dev -y
sudo apt install libatlas-ecmwf-utils -y
wget http://archive.ubuntu.com/ubuntu/pool/universe/m/meep-lam4/meep-lam4_1.7.0-3_amd64.deb
sudo dpkg -i meep-lam4_1.7.0-3_amd64.deb


 