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

#PACOTE m4#
sudo apt-get install -y m4 -y

#PACOTE meep-lam4#  amd64
sudo apt-get install libblas-dev liblapack-dev libopenblas-dev -y
sudo apt-get install guile-3.0 -y
sudo apt-get install mpich -y
Sudo apt-get install libhdf5-serial-dev -y
sudo apt-get install hdf5-tools -y
sudo apt-get install meep h5utils -y
sudo apt-get install libatlas-base-dev -y
sudo apt install libatlas-ecmwf-utils -y
wget https://ubuntu.pkgs.org/19.10/ubuntu-universe-amd64/meep-lam4_1.7.0-3_amd64.deb.html


#PACOTE abinit#
sudo apt-get install abinit -y

#PACOTE GaussSum e seus requerimentos#
sudo apt-get install gnuplot -y #instalando GNUplot
sudo apt-get install python3-numpy -y #instalando numpy
sudo python3 -m pip install cclib --upgrade  #instalando cclib
sudo apt-get install gausssum -y
#m4 e seus requerimentos
#git clone git://git.sv.gnu.org/m4
 