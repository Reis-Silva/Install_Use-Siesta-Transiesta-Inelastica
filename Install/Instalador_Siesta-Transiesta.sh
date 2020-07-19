#!/bin/bash

Packages() {

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
    echo "#Instalando programas essenciais de instalação\n\n"

    echo "##wget\n\n"
    sudo apt-get install wget -y #instalando para baixar direito de sites
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/w/wget/wget_1.20.3-1ubuntu1_amd64.deb
    sudo dpkg -i wget_1.20.3-1ubuntu1_amd64.deb
    echo "\n\n"

    echo "##unzip\n\n"
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/u/unzip/unzip_6.0-25ubuntu1_amd64.deb
    sudo dpkg -i unzip_6.0-25ubuntu1_amd64.deb
    echo "\n\n"

    echo "##python3-tk\n\n"
    wget -c http://archive.ubuntu.com/ubuntu/pool/main/t/tcl8.6/libtcl8.6_8.6.10+dfsg-1_amd64.deb
    sudo dpkg -i libtcl8.6_8.6.10+dfsg-1_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/main/t/tk8.6/libtk8.6_8.6.10-1_amd64.deb
    sudo dpkg -i libtk8.6_8.6.10-1_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/main/b/blt/tk8.6-blt2.5_2.5.3+dfsg-4_amd64.deb
    sudo dpkg -i tk8.6-blt2.5_2.5.3+dfsg-4_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/main/b/blt/blt_2.5.3+dfsg-4_amd64.deb
    sudo dpkg -i blt_2.5.3+dfsg-4_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/p/python3-stdlib-extensions/python3-tk_3.8.2-1ubuntu1_amd64.deb
    sudo dpkg -i python3-tk_3.8.2-1ubuntu1_amd64.deb
    echo "\n\n"

    echo "##python3\n\n"
    sudo apt-get install python3 -y #instalando Python 3
    echo "\n\n"

    echo "##python3-pip\n\n"
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/p/python3-stdlib-extensions/python3-distutils_3.8.2-1ubuntu1_all.deb
    sudo dpkg -i python3-distutils_3.8.2-1ubuntu1_all.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/s/setuptools/python3-pkg-resources_46.1.3-1_all.deb
    sudo dpkg -i python3-pkg-resources_46.1.3-1_all.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/s/setuptools/python3-setuptools_46.1.3-1_all.deb
    sudo dpkg -i python3-setuptools_46.1.3-1_all.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/w/wheel/python3-wheel_0.34.2-1_all.deb
    sudo dpkg -i python3-wheel_0.34.2-1_all.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/p/python-pip/python-pip-whl_20.0.2-5ubuntu1_all.deb
    sudo dpkg -i python-pip-whl_20.0.2-5ubuntu1_all.deb
    wget -c http://ports.ubuntu.com/pool/universe/p/python-pip/python3-pip_20.0.2-5ubuntu1_all.deb
    sudo dpkg -i python3-pip_20.0.2-5ubuntu1_all.deb
    echo "\n\n"

    ####PACOTES A SEREM INSTALADOS####
    echo "#####PACOTES A SEREM INSTALADOS####\n\n"

    #PACOTE gfortran
    echo "#PACOTE gfortran\n\n"
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/libf/libf2c2/libf2c2_20130926-3_amd64.deb
    sudo dpkg -i libf2c2_20130926-3_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/libf/libf2c2/libf2c2-dev_20130926-3_amd64.deb
    sudo dpkg -i libf2c2-dev_20130926-3_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/f/f2c/f2c_20160102-1_amd64.deb
    sudo dpkg -i f2c_20160102-1_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/universe/f/fort77/fort77_1.15-11_all.deb
    sudo dpkg -i fort77_1.15-11_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/g/gcc-10/libgfortran5_10-20200411-0ubuntu1_amd64.deb
    sudo dpkg -i libgfortran5_10-20200411-0ubuntu1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/g/gcc-9/libgfortran-9-dev_9.3.0-10ubuntu2_amd64.deb
    sudo dpkg -i libgfortran-9-dev_9.3.0-10ubuntu2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/g/gcc-9/gfortran-9_9.3.0-10ubuntu2_amd64.deb
    sudo dpkg -i gfortran-9_9.3.0-10ubuntu2_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/main/g/gcc-defaults/gfortran_9.3.0-1ubuntu2_amd64.deb
    sudo dpkg -i gfortran_9.3.0-1ubuntu2_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/main/g/gcc-5/gcc-5-base_5.4.0-6ubuntu1~16.04.12_amd64.deb
    sudo dpkg -i gcc-5-base_5.4.0-6ubuntu1~16.04.12_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/main/g/gcc-5/libgfortran3_5.4.0-6ubuntu1~16.04.12_amd64.deb
    sudo dpkg -i libgfortran3_5.4.0-6ubuntu1~16.04.12_amd64.deb
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
    sudo unzip -o master.zip
    cd netaddr-master
    sudo python3 setup.py install
    cd ..
    echo "\n\n"

    ###bcc
    echo "###bcc\n\n"
    sudo apt-get install bcc bpfcc-tools -y
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

    #PACOTE GPAW e suas dependencias
    echo "#PACOTE GPAW e suas dependencias\n\n"

    ##DEPENDENCIA libfftw3-dev
    echo "##DEPENDENCIA libfftw3-dev\n\n"

    wget -c http://ftp.us.debian.org/debian/pool/main/f/fftw3/libfftw3-single3_3.3.8-2_amd64.deb
    sudo dpkg -i libfftw3-single3_3.3.8-2_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/f/fftw3/libfftw3-long3_3.3.8-2_amd64.deb
    sudo dpkg -i libfftw3-long3_3.3.8-2_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/f/fftw3/libfftw3-double3_3.3.8-2_amd64.deb
    sudo dpkg -i libfftw3-double3_3.3.8-2_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/f/fftw3/libfftw3-quad3_3.3.8-2_amd64.deb
    sudo dpkg -i libfftw3-quad3_3.3.8-2_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/f/fftw3/libfftw3-bin_3.3.8-2_amd64.deb
    sudo dpkg -i libfftw3-bin_3.3.8-2_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/f/fftw3/libfftw3-dev_3.3.8-2_amd64.deb
    sudo dpkg -i libfftw3-dev_3.3.8-2_amd64.deb
    echo "\n\n"

    ##DEPENDENCIA libopenmpi3
    echo "##DEPENDENCIA libopenmpi3\n\n"
    wget -c http://archive.ubuntu.com/ubuntu/pool/main/libn/libnl3/libnl-3-dev_3.4.0-1_amd64.deb
    sudo dpkg -i libnl-3-dev_3.4.0-1_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/main/libn/libnl3/libnl-route-3-dev_3.4.0-1_amd64.deb
    sudo dpkg -i libnl-route-3-dev_3.4.0-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/libp/libpsm2/libpsm2-2_11.2.86-1_amd64.deb
    sudo dpkg -i libpsm2-2_11.2.86-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hwloc/libhwloc5_1.11.9-1_amd64.deb
    sudo dpkg -i libhwloc5_1.11.9-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/r/rdma-core/libibverbs1_28.0-1ubuntu1_amd64.deb
    sudo dpkg -i libibverbs1_28.0-1ubuntu1_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/main/r/rdma-core/ibverbs-providers_28.0-1ubuntu1_amd64.deb
    sudo dpkg -i ibverbs-providers_28.0-1ubuntu1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/r/rdma-core/librdmacm1_17.1-1_amd64.deb
    sudo dpkg -i librdmacm1_17.1-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/r/rdma-core/libibverbs-dev_28.0-1ubuntu1_amd64.deb
    sudo dpkg -i libibverbs-dev_28.0-1ubuntu1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/i/infinipath-psm/libpsm-infinipath1_3.3+20.604758e7-5_amd64.deb
    sudo dpkg -i libpsm-infinipath1_3.3+20.604758e7-5_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/o/ocl-icd/ocl-icd-libopencl1_2.2.11-1ubuntu1_amd64.deb
    sudo dpkg -i ocl-icd-libopencl1_2.2.11-1ubuntu1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hwloc/libhwloc-plugins_1.11.9-1_amd64.deb
    sudo dpkg -i libhwloc-plugins_1.11.9-1_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/main/n/numactl/libnuma1_2.0.12-1_amd64.deb
    sudo dpkg -i libnuma1_2.0.12-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/libp/libpsm2/libpsm2-2_11.2.86-1_amd64.deb
    sudo dpkg -i libpsm2-2_11.2.86-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/libf/libfabric/libfabric1_1.5.3-1_amd64.deb
    sudo dpkg -i libfabric1_1.5.3-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/libe/libevent/libevent-2.1-7_2.1.11-stable-1_amd64.deb
    sudo dpkg -i libevent-2.1-7_2.1.11-stable-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/libe/libevent/libevent-core-2.1-7_2.1.11-stable-1_amd64.deb
    sudo dpkg -i libevent-core-2.1-7_2.1.11-stable-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/libe/libevent/libevent-pthreads-2.1-7_2.1.11-stable-1_amd64.deb
    sudo dpkg -i libevent-pthreads-2.1-7_2.1.11-stable-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/p/pmix/libpmix2_3.1.5-1_amd64.deb
    sudo dpkg -i libpmix2_3.1.5-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hwloc/libhwloc15_2.1.0+dfsg-4_amd64.deb
    sudo dpkg -i libhwloc15_2.1.0+dfsg-4_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/o/openmpi/libopenmpi3_4.0.3-0ubuntu1_amd64.deb
    sudo dpkg -i libopenmpi3_4.0.3-0ubuntu1_amd64.deb libopenmpi3_4.0.3-0ubuntu1_amd64.deb
    echo "\n\n"

    ##DEPENDENCIA openmpi-bin
    echo "##DEPENDENCIA openmpi-bin\n\n"
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/o/openmpi/libopenmpi2_2.1.1-8_amd64.deb
    sudo dpkg -i libopenmpi2_2.1.1-8_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/o/openmpi/openmpi-common_4.0.3-0ubuntu1_all.deb
    sudo dpkg -i openmpi-common_4.0.3-0ubuntu1_all.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/o/openmpi/openmpi-bin_4.0.3-0ubuntu1_amd64.deb
    sudo dpkg -i openmpi-bin_4.0.3-0ubuntu1_amd64.deb
    echo "\n\n"

    ##DEPEDENCIA libxc5
    echo "##DEPEDENCIA libxc5\n\n"
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/libx/libxc/libxc5_4.3.4-1build1_amd64.deb
    sudo dpkg -i libxc5_4.3.4-1build1_amd64.deb
    echo "\n\n"

    ##DEPEDENCIA python3-numpy
    echo "##DEPENDENCIA python3-numpy\n\n"
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/l/lapack/libblas3_3.9.0-1build1_amd64.deb
    sudo dpkg -i libblas3_3.9.0-1build1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/l/lapack/liblapack3_3.9.0-1build1_amd64.deb
    sudo dpkg -i liblapack3_3.9.0-1build1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/n/numpy/python3-numpy_1.17.4-5ubuntu3_amd64.deb
    sudo dpkg -i python3-numpy_1.17.4-5ubuntu3_amd64.deb #instalando numpy
    echo "\n\n"

    ##DEPEDENCIA matplotlib
    echo "##DEPENDENCIA matplotlib\n\n"
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/l/lyx/fonts-lyx_2.3.4.2-2_all.deb
    sudo dpkg -i fonts-lyx_2.3.4.2-2_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/t/ttf-bitstream-vera/ttf-bitstream-vera_1.10-8_all.deb
    sudo dpkg -i ttf-bitstream-vera_1.10-8_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/m/matplotlib/python-matplotlib-data_3.1.2-1ubuntu4_all.deb
    sudo dpkg -i python-matplotlib-data_3.1.2-1ubuntu4_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/p/pyparsing/python3-pyparsing_2.4.6-1_all.deb
    sudo dpkg -i python3-pyparsing_2.4.6-1_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/j/jquery/libjs-jquery_3.3.1~dfsg-3_all.deb
    sudo dpkg -i libjs-jquery_3.3.1~dfsg-3_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/j/javascript-common/javascript-common_11_all.deb
    sudo dpkg -i libjs-jquery_3.3.1~dfsg-3_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/j/jqueryui/libjs-jquery-ui_1.12.1+dfsg-5_all.deb
    sudo dpkg -i libjs-jquery-ui_1.12.1+dfsg-5_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/p/python-cycler/python3-cycler_0.10.0-3_all.deb
    sudo dpkg -i python3-cycler_0.10.0-3_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/k/kiwisolver/python3-kiwisolver_1.0.1-3build1_amd64.deb
    sudo dpkg -i python3-kiwisolver_1.0.1-3build1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/m/matplotlib/python3-matplotlib_3.1.2-1ubuntu4_amd64.deb
    sudo dpkg -i python3-matplotlib_3.1.2-1ubuntu4_amd64.deb
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
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/e/expat/libexpat1-dev_2.2.9-1build1_amd64.deb
    sudo dpkg -i libexpat1-dev_2.2.9-1build1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/z/zlib/zlib1g-dev_1.2.11.dfsg-2ubuntu1_amd64.deb
    sudo dpkg -i zlib1g-dev_1.2.11.dfsg-2ubuntu1_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/libpython3.8-stdlib_3.8.2-1ubuntu1.1_amd64.deb
    sudo dpkg -i libpython3.8-stdlib_3.8.2-1ubuntu1.1_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/libpython3.8_3.8.2-1ubuntu1.1_amd64.deb
    sudo dpkg -i libpython3.8_3.8.2-1ubuntu1.1_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/libpython3.8-dev_3.8.2-1ubuntu1.1_amd64.deb
    sudo dpkg -i libpython3.8-dev_3.8.2-1ubuntu1.1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python3-defaults/libpython3-dev_3.8.2-3_amd64.deb
    sudo dpkg -i libpython3-dev_3.8.2-3_amd64.deb
    wget http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/python3.8-dev_3.8.2-1ubuntu1.1_amd64.deb
    sudo dpkg -i python3.8-dev_3.8.2-1ubuntu1.1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python3-defaults/python3-dev_3.8.2-3_amd64.deb
    sudo dpkg -i python3-dev_3.8.2-3_amd64.deb
    sudo apt-get install libopenblas-dev libxc-dev libscalapack-mpi-dev -y
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/f/fonts-font-awesome/fonts-font-awesome_5.0.10+really4.7.0~dfsg-1_all.deb
    sudo dpkg -i fonts-font-awesome_5.0.10+really4.7.0~dfsg-1_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/t/twitter-bootstrap3/fonts-glyphicons-halflings_1.009~3.4.1+dfsg-1_all.deb
    sudo dpkg -i fonts-glyphicons-halflings_1.009~3.4.1+dfsg-1_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/t/twitter-bootstrap3/libjs-bootstrap_3.4.1+dfsg-1_all.deb
    sudo dpkg -i libjs-bootstrap_3.4.1+dfsg-1_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/s/spglib/python3-spglib_1.14.1-5build2_amd64.deb
    sudo dpkg -i python3-spglib_1.14.1-5build2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/c/cftime/python3-cftime_1.1.0+ds-1build1_amd64.deb
    sudo dpkg -i python3-cftime_1.1.0+ds-1build1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/liba/libaec/libaec0_1.0.4-1_amd64.deb
    sudo dpkg -i libaec0_1.0.4-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/liba/libaec/libsz2_1.0.4-1_amd64.deb
    sudo dpkg -i libsz2_1.0.4-1_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/h/hdf5/libhdf5-103_1.10.4+repack-11ubuntu1_amd64.deb
    sudo dpkg -i libhdf5-103_1.10.4+repack-11ubuntu1_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/n/netcdf/libnetcdf15_4.7.3-1_amd64.deb
    sudo dpkg -i libnetcdf15_4.7.3-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/n/netcdf4-python/python3-netcdf4_1.5.3-1build2_amd64.deb
    sudo dpkg -i python3-netcdf4_1.5.3-1build2_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/universe/h/hdf5/libhdf5-10_1.8.16+docs-4ubuntu1.1_amd64.deb
    sudo dpkg -i libhdf5-10_1.8.16+docs-4ubuntu1.1_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/universe/h/hdf5/libhdf5-cpp-11_1.8.16+docs-4ubuntu1.1_amd64.deb
    sudo dpkg -i libhdf5-cpp-11_1.8.16+docs-4ubuntu1.1_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8-dev_2.0.3-0ubuntu1.20.04.1_amd64.deb
    sudo dpkg -i libjpeg-turbo8-dev_2.0.3-0ubuntu1.20.04.1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/libj/libjpeg8-empty/libjpeg8-dev_8c-2ubuntu8_amd64.deb
    sudo dpkg -i libjpeg8-dev_8c-2ubuntu8_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/libj/libjpeg8-empty/libjpeg-dev_8c-2ubuntu8_amd64.deb
    sudo dpkg -i libjpeg-dev_8c-2ubuntu8_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/liba/libaec/libaec0_1.0.4-1_amd64.deb
    sudo dpkg -i libaec0_1.0.4-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/liba/libaec/libsz2_1.0.4-1_amd64.deb
    sudo dpkg -i libsz2_1.0.4-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/liba/libaec/libaec-dev_1.0.4-1_amd64.deb
    sudo dpkg -i libaec-dev_1.0.4-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hdf5/hdf5-helpers_1.10.4+repack-11ubuntu1_amd64.deb
    sudo dpkg -i hdf5-helpers_1.10.4+repack-11ubuntu1_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/universe/h/hdf5/libhdf5-dev_1.8.16+docs-4ubuntu1.1_amd64.deb
    sudo dpkg -i libhdf5-dev_1.8.16+docs-4ubuntu1.1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/n/netcdf/libnetcdf11_4.4.0-2_amd64.deb
    sudo dpkg -i libnetcdf11_4.4.0-2_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/main/n/nettle/libnettle6_3.2-1ubuntu0.16.04.1_amd64.deb
    sudo dpkg -i libnettle6_3.2-1ubuntu0.16.04.1_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/main/c/curl/libcurl3-gnutls_7.47.0-1ubuntu2.15_amd64.deb
    sudo dpkg -i libcurl3-gnutls_7.47.0-1ubuntu2.15_amd64.deb
    wget -c http://security.ubuntu.com/ubuntu/pool/main/c/curl/libcurl4-gnutls-dev_7.47.0-1ubuntu2.15_amd64.deb
    sudo dpkg -i libcurl4-gnutls-dev_7.47.0-1ubuntu2.15_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/n/netcdf/libnetcdf-dev_4.4.0-2_amd64.deb
    sudo dpkg -i libnetcdf-dev_4.4.0-2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/n/netcdf/libnetcdf15_4.7.3-1_amd64.deb
    sudo dpkg -i libnetcdf15_4.7.3-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/n/netcdf-fortran/libnetcdff7_4.5.2+ds-1build2_amd64.deb
    sudo dpkg -i libnetcdff7_4.5.2+ds-1build2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/n/netcdf-fortran/libnetcdff-dev_4.5.2+ds-1build2_amd64.deb
    sudo dpkg -i libnetcdff-dev_4.5.2+ds-1build2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/p/python-decorator/python3-decorator_4.4.2-0ubuntu1_all.deb
    sudo dpkg -i python3-decorator_4.4.2-0ubuntu1_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/l/lbfgsb/liblbfgsb0_3.0+dfsg.3-7build1_amd64.deb
    sudo dpkg -i liblbfgsb0_3.0+dfsg.3-7build1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/s/scipy/python3-scipy_1.3.3-3build1_amd64.deb
    sudo dpkg -i python3-scipy_1.3.3-3build1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/p/python-ase/python3-ase_3.19.0-1_all.deb
    sudo dpkg -i python3-ase_3.19.0-1_all.deb
    echo "\n\n"

    ###GPAW
    echo "###GPAW\n\n"
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gpaw-setups/gpaw-data_0.9.20000-2_all.deb
    sudo dpkg -i gpaw-data_0.9.20000-2_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gpaw/gpaw_20.1.0-2build1_amd64.deb
    sudo dpkg -i gpaw_20.1.0-2build1_amd64.deb
    echo "\n\n"

    #PACOTE abinit
    echo "#PACOTE abinit\n\n"
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/a/abinit/abinit-data_8.10.2-2_all.deb
    sudo dpkg -i abinit-data_8.10.2-2_all.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/a/abinit/abinit_8.10.2-2_amd64.deb
    sudo dpkg -i abinit_8.10.2-2_amd64.deb
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
    wget -c http://security.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8-dev_2.0.3-0ubuntu1.20.04.1_amd64.deb
    sudo dpkg -i libjpeg-turbo8-dev_2.0.3-0ubuntu1.20.04.1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/libj/libjpeg8-empty/libjpeg8-dev_8c-2ubuntu8_amd64.deb
    sudo dpkg -i libjpeg8-dev_8c-2ubuntu8_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/libj/libjpeg8-empty/libjpeg-dev_8c-2ubuntu8_amd64.deb
    sudo dpkg -i libjpeg-dev_8c-2ubuntu8_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/liba/libaec/libaec0_1.0.4-1_amd64.deb
    sudo dpkg -i libaec0_1.0.4-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/liba/libaec/libsz2_1.0.4-1_amd64.deb
    sudo dpkg -i libsz2_1.0.4-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/liba/libaec/libaec-dev_1.0.4-1_amd64.deb
    sudo dpkg -i libaec-dev_1.0.4-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hdf5/hdf5-helpers_1.10.4+repack-11ubuntu1_amd64.deb
    sudo dpkg -i hdf5-helpers_1.10.4+repack-11ubuntu1_amd64.deb
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
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hdf5/libhdf5-cpp-103_1.10.4+repack-11ubuntu1_amd64.deb
    sudo dpkg -i libhdf5-cpp-103_1.10.4+repack-11ubuntu1_amd64.deb
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
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/guile-3.0/guile-3.0-libs_3.0.1+1-2_amd64.deb
    sudo dpkg -i guile-3.0-libs_3.0.1+1-2_amd64.deb
    sudo apt-get install guile-3.0 -y
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hwloc/hwloc-nox_2.1.0+dfsg-4_amd64.deb
    sudo dpkg -i hwloc-nox_2.1.0+dfsg-4_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/m/mpich/libmpich12_3.3.2-2build1_amd64.deb
    sudo dpkg -i libmpich12_3.3.2-2build1_amd64.deb
    sudo apt-get install mpich -y
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/x/xxhash/libxxhash0_0.7.3-1_amd64.deb
    sudo dpkg -i libxxhash0_0.7.3-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/e/eckit/libeckit0d_1.4.7-7build1_amd64.deb
    sudo dpkg -i libeckit0d_1.4.7-7build1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/p/proj/proj-data_6.3.1-1_all.deb
    sudo dpkg -i proj-data_6.3.1-1_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/p/proj/libproj15_6.3.1-1_amd64.deb
    sudo dpkg -i libproj15_6.3.1-1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/a/atlas-ecmwf/libatlas-ecmwf-0_0.19.0-8build1_amd64.deb
    sudo dpkg -i libatlas-ecmwf-0_0.19.0-8build1_amd64.deb
    sudo apt-get install libhdf5-serial-dev -y
    sudo apt-get install hdf5-tools -y
    sudo apt-get install libatlas-base-dev -y
    sudo apt install libatlas-ecmwf-utils -y
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/m/meep-lam4/meep-lam4_1.7.0-3_amd64.deb
    sudo dpkg -i meep-lam4_1.7.0-3_amd64.deb
    echo "\n\n"

    #PACOTE GaussSum e suas dependencias
    echo "#PACOTE GaussSum e suas dependencias\n\n"

    ##DEPENDENCIAS
    echo "##DEPENDENCIA gnuplot\n\n"
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/a/aglfn/aglfn_1.7+git20191031.4036a9c-2_all.deb
    sudo dpkg -i aglfn_1.7+git20191031.4036a9c-2_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gnuplot/gnuplot-data_5.2.8+dfsg1-2_all.deb
    sudo dpkg -i gnuplot-data_5.2.8+dfsg1-2_all.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/d/double-conversion/libdouble-conversion3_3.1.5-4ubuntu1_amd64.deb
    sudo dpkg -i libdouble-conversion3_3.1.5-4ubuntu1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/p/pcre2/libpcre2-16-0_10.34-7_amd64.deb
    sudo dpkg -i libpcre2-16-0_10.34-7_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/q/qtbase-opensource-src/libqt5core5a_5.12.8+dfsg-0ubuntu1_amd64.deb
    sudo dpkg -i libqt5core5a_5.12.8+dfsg-0ubuntu1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/q/qtbase-opensource-src/libqt5dbus5_5.12.8+dfsg-0ubuntu1_amd64.deb
    sudo dpkg -i libqt5dbus5_5.12.8+dfsg-0ubuntu1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/q/qtbase-opensource-src/libqt5network5_5.12.8+dfsg-0ubuntu1_amd64.deb
    sudo dpkg -i libqt5network5_5.12.8+dfsg-0ubuntu1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/libx/libxcb/libxcb-xinerama0_1.14-2_amd64.deb
    sudo dpkg -i libxcb-xinerama0_1.14-2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/main/libx/libxcb/libxcb-xinput0_1.14-2_amd64.deb
    sudo dpkg -i libxcb-xinput0_1.14-2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/q/qtbase-opensource-src/libqt5gui5_5.12.8+dfsg-0ubuntu1_amd64.deb
    sudo dpkg -i libqt5gui5_5.12.8+dfsg-0ubuntu1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/q/qtbase-opensource-src/libqt5widgets5_5.12.8+dfsg-0ubuntu1_amd64.deb
    sudo dpkg -i libqt5widgets5_5.12.8+dfsg-0ubuntu1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/q/qtbase-opensource-src/libqt5printsupport5_5.12.8+dfsg-0ubuntu1_amd64.deb
    sudo dpkg -i libqt5printsupport5_5.12.8+dfsg-0ubuntu1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/q/qtsvg-opensource-src/libqt5svg5_5.12.8-0ubuntu1_amd64.deb
    sudo dpkg -i libqt5svg5_5.12.8-0ubuntu1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/w/wxwidgets3.0/libwxbase3.0-0v5_3.0.4+dfsg-15build1_amd64.deb
    sudo dpkg -i libwxbase3.0-0v5_3.0.4+dfsg-15build1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/w/wxwidgets3.0/libwxgtk3.0-gtk3-0v5_3.0.4+dfsg-15build1_amd64.deb
    sudo dpkg -i libwxgtk3.0-gtk3-0v5_3.0.4+dfsg-15build1_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gnuplot/gnuplot-qt_5.2.8+dfsg1-2_amd64.deb
    sudo dpkg -i gnuplot-qt_5.2.8+dfsg1-2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gnuplot/gnuplot_5.2.8+dfsg1-2_all.deb #instalando GNUplot
    sudo dpkg -i gnuplot_5.2.8+dfsg1-2_all.deb
    echo "\n\n"

    ##DEPENDENCIA cclib
    echo "##DEPENDENCIA cclib\n\n"
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/c/cclib/python3-cclib_1.6.2-2_all.deb
    sudo dpkg -i python3-cclib_1.6.2-2_all.deb #instalando cclib
    echo "\n\n"

    ###gausssum
    echo "###gausssum\n\n"
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gausssum/gausssum_3.0.2-2_all.deb
    sudo dpkg -i gausssum_3.0.2-2_all.deb
    echo "\n\n"

    #Reatualização de repositorios e bibliotecas
    echo "Reatualização de repositorios e bibliotecas\n\n"
    sudo apt-get update -y
    sudo apt-get dist-upgrade -y
    echo "\n\n"

    cd ..
}

arch_make() {

    rm arch.make
    cp gfortran.make gfortran.bkp

    #CONSTRUINDO O ARCH_MAKE DO GFORTRAN
    echo "#CONSTRUINDO O ARCH_MAKE DO GFORTRAN\n\n"

    var2="$(uname -mrs)"
    sed -i '18s, unknown, SIESTA 4.1 - '"$var2"',' gfortran.make
    sed -i "20s/CC = gcc/CPP = gcc -E -P -x c/" gfortran.make
    sed -i '22s, gfortran, mpif90,' gfortran.make
    sed -i "24s,^,INCFLAGS += -I"$var"\/siesta-master\/Docs\/build\/include,g" gfortran.make
    sed -i '25s/FFLAGS = -O2 -fPIC -ftree-vectorize/FFLAGS=-g -O2 $(INCFLAGS)/' gfortran.make
    sed -i '36s|LDFLAGS =|LDFLAGS=-L'"$var"'\/siesta-master\/Docs\/build\/lib -wl,-rpath='"$var"'\/siesta-master\/Docs\/build\/lib|' gfortran.make
    sed -i "38s,COMP_LIBS = libsiestaLAPACK.a libsiestaBLAS.a,COMP_LIBS="$var"\/siesta-master\/Obj\/ncdf\/obj\/libncdf.a "$var"\/siesta-master\/Obj\/fdict/obj/libfdict.a "$var"\/siesta-master\/Obj\/libsiestaLAPACK.a "$var"\/siesta-master\/Obj\/libsiestaBLAS.a \/usr\/lib\/x86_64-linux-gnu\/libfftw3f.a \/usr\/lib\/x86_64-linux-gnu\/libfftw3.a\n\n\n\n/," gfortran.make
    sed -i "40s/^/BLAS_LIBS=-lblas/" gfortran.make
    sed -i "41s/^/LAPACK_LIBS=-llapack/" gfortran.make
    sed -i "42s/^/SCALAPACK_LIBS=\/usr\/lib\/X86_64-linux-gnu\/libscalapack-openmpi.so/" gfortran.make
    sed -i '44s/FPPFLAGS = $(DEFS_PREFIX)-DFC_HAVE_ABORT/FPPFLAGS = $(FPPFLAGS_MPI) $(DEFS_PREFIX) -DMPI -DFC_HAVE_FLUSH -DGFORTRAN -DFC_HAVE_ABORT -DGRID_DP -DPHI_GRID_SP $(FPPFLAGS_CDF) -DTRANSIESTA/' gfortran.make
    sed -i '46s/LIBS =/LIBS =  $(COMP_LIBS) $(SCALAPACK_LIBS) $(LAPACK_LIBS) $(BLAS_LIBS) $(INCFLAGS)\n\n\n/' gfortran.make
    sed -i "48s/^/MPI_INTERFACE=libmpi_f90.a/" gfortran.make
    sed -i "49s/^/MPI_INCLUDE=./" gfortran.make
    sed -i "53s/FFLAGS_DEBUG = -g -O1/FFLAGS_DEBUG = -g -O0/" gfortran.make

    cp gfortran.make arch.make
    rm gfortran.make
    cp gfortran.bkp gfortran.make
    rm gfortran.bkp

    ###ARCH_MAKE DO GFORTRAN CRIADO
    echo "##ARCH_MAKE DO GFORTRAN CRIADO\n\n"

    ######iNSTALANDO SIESTA4.1
    echo "###iNSTALANDO SIESTA4.1\n\n"
    make
    sudo cp siesta /usr/local/bin/siesta
    echo "\n\n"
}

InstalacaoSiestaTransiesta() {

    wget -c https://gitlab.com/siesta-project/siesta/-/archive/master/siesta-master.tar.gz
    tar -vzxf siesta-master.tar.gz
    var="$(pwd)"
    #Escrevendo arquivo gfortran.make
    echo "#Escrevendo arquivo gfortran.make\n\n"

    tar vxf siesta-master.tar.gz -C $var/siesta-master/Obj siesta-master/Obj/gfortran.make
    echo "\n\n"

    #./install_netcdf4.bash
    echo "#./install_netcdf4.bash\n\n"
    cd siesta-master/Docs
    wget -c https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.12/hdf5-1.12.0/src/hdf5-1.12.0.tar.bz2
    wget -c https://github.com/Unidata/netcdf-c/archive/v4.7.2.tar.gz
    wget -c https://github.com/Unidata/netcdf-fortran/archive/v4.5.2.tar.gz
    wget -c https://zlib.net/zlib-1.2.11.tar.gz
    ./install_netcdf4.bash
    echo "\n\n"

    cd ..
    cd Obj
    sh ../Src/obj_setup.sh
    arch_make

    ###COMPILANDO TODOS OS PROGRAMAS DA PASTA UTILS DO SIESTA
    echo "###COMPILANDO TODOS OS PROGRAMAS DA PASTA UTILS DO SIESTA\n\n"
    cd ..
    cd ..
    tar vxf siesta-master.tar.gz -C $var/siesta-master/Util/Gen-basis siesta-master/Util/Gen-basis
    cd siesta-master/Util/Gen-basis
    sed -i "103s/^/ \t/" Makefile
    cd ..
    sh build_all.sh
    echo "\n\n"

    ###COMPIANDO TODOS OS PROGRAMAS DA PASTA UTILS DO SIESTA PARA A PASTA BIN DO SISTEMA
    echo "###COMPIANDO TODOS OS PROGRAMAS DA PASTA UTILS DO SIESTA PARA A PASTA BIN DO SISTEMA"
    sudo cp tbtrans /usr/local/bin/tbtrans
    sudo cp ts2ts /usr/local/bin/ts2ts
    sudo cp tshs2tshs /usr/local/bin/tshs2tshs
    echo "TERMÍNO DAS COPIAS\n\n"

    #Voltando para Pasta PackagesSIETRANINEL
    cd ..
    cd ..
}

Inelastica() {

    ###INSTALAÇÃO DO INELASTICA 446
    echo "###INSTALAÇÃO DO INELASTICA 446\n\n"
    
    
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python2.7/libpython2.7-minimal_2.7.16-2+deb10u1_amd64.deb
    sudo dpkg -i libpython2.7-minimal_2.7.16-2+deb10u1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python2.7/python2.7-minimal_2.7.16-2+deb10u1_amd64.deb
    sudo dpkg -i python2.7-minimal_2.7.16-2+deb10u1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/python2-minimal_2.7.16-1_amd64.deb
    sudo dpkg -i python2-minimal_2.7.16-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/python-minimal_2.7.16-1_amd64.deb
    sudo dpkg -i python-minimal_2.7.16-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/libf/libffi/libffi6_3.2.1-9_amd64.deb
    sudo dpkg -i libffi6_3.2.1-9_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/r/readline/libreadline7_7.0-5_amd64.deb
    sudo dpkg -i libreadline7_7.0-5_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python2.7/libpython2.7-stdlib_2.7.16-2+deb10u1_amd64.deb
    sudo dpkg -i libpython2.7-stdlib_2.7.16-2+deb10u1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python2.7/python2.7_2.7.16-2+deb10u1_amd64.deb
    sudo dpkg -i python2.7_2.7.16-2+deb10u1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/libpython2-stdlib_2.7.16-1_amd64.deb
    sudo dpkg -i libpython2-stdlib_2.7.16-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/libpython-stdlib_2.7.16-1_amd64.deb
    sudo dpkg -i libpython-stdlib_2.7.16-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/python2_2.7.16-1_amd64.deb
    sudo dpkg -i python2_2.7.16-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/python_2.7.16-1_amd64.deb
    sudo dpkg -i python_2.7.16-1_amd64.deb


    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-7/gcc-7-base_7.5.0-6ubuntu2_amd64.deb
    sudo dpkg -i gcc-7-base_7.5.0-6ubuntu2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-7/cpp-7_7.5.0-6ubuntu2_amd64.deb
    sudo dpkg -i cpp-7_7.5.0-6ubuntu2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-7/libasan4_7.5.0-6ubuntu2_amd64.deb
    sudo dpkg -i libasan4_7.5.0-6ubuntu2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-7/libubsan0_7.5.0-6ubuntu2_amd64.deb
    sudo dpkg -i libubsan0_7.5.0-6ubuntu2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-7/libcilkrts5_7.5.0-6ubuntu2_amd64.deb
    sudo dpkg -i libcilkrts5_7.5.0-6ubuntu2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-8/gcc-8-base_8.4.0-3ubuntu2_amd64.deb
    sudo dpkg -i gcc-8-base_8.4.0-3ubuntu2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-8/libmpx2_8.4.0-3ubuntu2_amd64.deb
    sudo dpkg -i libmpx2_8.4.0-3ubuntu2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-7/libgcc-7-dev_7.5.0-6ubuntu2_amd64.deb
    sudo dpkg -i libgcc-7-dev_7.5.0-6ubuntu2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-7/gcc-7_7.5.0-6ubuntu2_amd64.deb
    sudo dpkg -i gcc-7_7.5.0-6ubuntu2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-7/libgfortran-7-dev_7.5.0-6ubuntu2_amd64.deb
    sudo dpkg -i libgfortran-7-dev_7.5.0-6ubuntu2_amd64.deb
    wget -c http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-7/gfortran-7_7.5.0-6ubuntu2_amd64.deb
    sudo dpkg -i gfortran-7_7.5.0-6ubuntu2_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/e/elpa/libelpa-dev_2016.05.001-6build1_amd64.deb
    sudo dpkg -i libelpa-dev_2016.05.001-6build1_amd64.deb


    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-setuptools/python-pkg-resources_40.8.0-1_all.deb
    sudo dpkg -i python-pkg-resources_40.8.0-1_all.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-numpy/python-numpy_1.16.2-1_amd64.deb
    sudo dpkg -i python-numpy_1.16.2-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/u/underscore/libjs-underscore_1.9.1~dfsg-1_all.deb
    sudo dpkg -i libjs-underscore_1.9.1~dfsg-1_all.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/s/sphinx/libjs-sphinxdoc_1.8.4-1_all.deb
    sudo dpkg -i libjs-sphinxdoc_1.8.4-1_all.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-numpy/python-numpy-doc_1.16.2-1_all.deb
    sudo dpkg -i python-numpy-doc_1.16.2-1_all.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python2.7/libpython2.7-dbg_2.7.16-2+deb10u1_amd64.deb
    sudo dpkg -i libpython2.7-dbg_2.7.16-2+deb10u1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/libpython2-dbg_2.7.16-1_amd64.deb
    sudo dpkg -i libpython2-dbg_2.7.16-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/libpython-dbg_2.7.16-1_amd64.deb
    sudo dpkg -i libpython-dbg_2.7.16-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python2.7/python2.7-dbg_2.7.16-2+deb10u1_amd64.deb
    sudo dpkg -i python2.7-dbg_2.7.16-2+deb10u1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/python2-dbg_2.7.16-1_amd64.deb
    sudo dpkg -i python2-dbg_2.7.16-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/python-dbg_2.7.16-1_amd64.deb
    sudo dpkg -i python-dbg_2.7.16-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-numpy/python-numpy-dbg_1.16.2-1_amd64.deb
    sudo dpkg -i python-numpy-dbg_1.16.2-1_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/s/six/python-six_1.12.0-2_all.deb
    sudo dpkg -i python-six_1.12.0-2_all.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/h/hdf5/libhdf5-openmpi-103_1.10.4+repack-11ubuntu1_amd64.deb
    sudo dpkg -i libhdf5-openmpi-103_1.10.4+repack-11ubuntu1_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/m/mpi4py/python-mpi4py_3.0.2-13_amd64.deb
    sudo dpkg -i python-mpi4py_3.0.2-13_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/h/h5py/python-h5py_2.9.0-7_amd64.deb
    sudo dpkg -i python-h5py_2.9.0-7_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-setuptools/python-pkg-resources_44.0.0-3_all.deb
    sudo dpkg -i python-pkg-resources_44.0.0-3_all.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-setuptools/python-setuptools_44.0.0-3_all.deb
    sudo dpkg -i python-setuptools_44.0.0-3_all.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python2.7/libpython2.7_2.7.16-2+deb10u1_amd64.deb
    sudo dpkg -i libpython2.7_2.7.16-2+deb10u1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python2.7/libpython2.7-dev_2.7.16-2+deb10u1_amd64.deb
    sudo dpkg -i libpython2.7-dev_2.7.16-2+deb10u1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/libpython2-dev_2.7.16-1_amd64.deb
    sudo dpkg -i libpython2-dev_2.7.16-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/libpython-dev_2.7.16-1_amd64.deb
    sudo dpkg -i libpython-dev_2.7.16-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python2.7/python2.7-dev_2.7.16-2+deb10u1_amd64.deb
    sudo dpkg -i python2.7-dev_2.7.16-2+deb10u1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/python2-dev_2.7.16-1_amd64.deb
    sudo dpkg -i python2-dev_2.7.16-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/p/python-defaults/python-dev_2.7.16-1_amd64.deb
    sudo dpkg -i python-dev_2.7.16-1_amd64.deb
    wget -c http://ftp.us.debian.org/debian/pool/main/libf/libffi/libffi-dev_3.2.1-9_amd64.deb
    sudo dpkg -i libffi-dev_3.2.1-9_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/c/cython/cython_0.29.14-0.1ubuntu3_amd64.deb
    sudo dpkg -i cython_0.29.14-0.1ubuntu3_amd64.deb
    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/n/netcdf/libnetcdf13_4.6.2-1build1_amd64.deb
    sudo dpkg -i libnetcdf13_4.6.2-1build1_amd64.deb
    wget -c http://ftp.br.debian.org/debian/pool/main/c/cftime/python-cftime_1.0.3.4-1_amd64.deb
    sudo dpkg -i python-cftime_1.0.3.4-1_amd64.deb
    wget -c http://ftp.br.debian.org/debian/pool/main/n/netcdf4-python/python-netcdf4_1.4.2-1+b1_amd64.deb
    sudo dpkg -i python-netcdf4_1.4.2-1+b1_amd64.deb

    # instalar destino de inelastica | reinstalar python3-netcdf4 |

    cd ..

    wget -c https://github.com/Unidata/netcdf4-python/archive/master.zip
    sudo unzip -o master.zip
    cd netcdf4-python-master
    sudo python setup.py build
    sudo python setup.py install
    cd test && python run_all.py

    cd ..

    wget -c https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/netcdf4-python/1.5.3-1build4/netcdf4-python_1.5.3.orig.tar.gz
    tar vxf netcdf4-python_1.5.3.orig.tar.gz

    wget -c http://archive.ubuntu.com/ubuntu/pool/universe/h/hdf5/libhdf5-100_1.10.0-patch1+docs-4_amd64.deb
    sudo dpkg -i libhdf5-100_1.10.0-patch1+docs-4_amd64.deb
    wget -c https://sourceforge.net/projects/inelastica/files/inelastica-code-446.zip/download
    sudo unzip -o download
    cd inelastica-code-446 
    rm -r build
    sudo python setup.py build --fcompiler=gfortran
    sudo python3 setup.py install 
    
    chmod -R go+rx /usr/lib/python3.8/site-packages/Inelastica
    echo "TERMÍNO DA INSTALAÇÃO DO INELASTICA 446\n\n"
}

SiestaTransiestaInelastica() {

    if [ -e "PackagesSIETRANINEL" ]; then
        echo 'O DIRETÓRIO \033[32mPackagesSIETRAN"\033[00m EXISTE
        \n\n MUDANDO O DIRETÓRIO ATUAL PARA: \033[05;33m"PackagesSIETRAN"\033[00;00m\n\n'
        sleep 2
        cd PackagesSIETRANINEL
        InstalacaoSiestaTransiesta
        Inelastica

    else
        echo 'O DIRETÓRIO \033[32m"PackagesSIETRAN"\033[00m NÃO EXISTE
        \n\n CRIANDO O DIRETÓRIO: \033[05;33m"PackagesSIETRAN"\033[00;00m\n\n'
        mkdir PackagesSIETRANINEL
        cd PackagesSIETRANINEL
        sleep 2
        InstalacaoSiestaTransiesta
        Inelastica
    fi

}

####INICIANDO SISTEMA####
echo '\033[05;37m                              ####INICIANDO SISTEMA####\033[00;00m\n\n'
sleep 3

while :; do

    echo '\033[05;37m                     ####ESCOLHA A OPÇÃO####\033[00;00m
    \n\033[01;36m 1 - INSTALAR OS PACOTES INICIAIS PARA SIESTA/TRANSIESTA\033[00;00m
    \n\033[01;32m 2 - INSTALAÇÃO SIESTA/TRANSIESTA/INELASTICA\033[00;00m
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

    2) SiestaTransiestaInelastica ;;

    3) exit ;;

    *) echo "Opcao Invalida!" ;;
    esac
done
