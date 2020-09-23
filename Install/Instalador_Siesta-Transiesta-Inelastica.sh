#!/bin/bash
############################################################################################################################
#DEVELOPER: REIS-SILVA                                                                                                     #
#LINK YOUTUBE: https://www.youtube.com/watch?v=af9cmUdHDJ8       #VIDEO INTRODUTÓRIO DE INSTALAÇÃO                         #
#LINK YOUTUBE (UPDATE 1):                                                                                                  #
#LINK GITHUB-PESSOAl-InstaladorCriado: https://github.com/Reis-Silva/Install_Use-Siesta-Transiesta-Inelastica              #
#LINK GITLAB SIESTA: https://gitlab.com/siesta-project/siesta                                                              #
#                                                                                                                          #
#                                                                                                                          #
#Opções de instalação completa na interface do programa:                                                                   #
#[1] - Todos os Pacotes essenciais - SIESTA                                                                                #
#[2] - Siesta/Transiesta - OBS: Todos os programas UTILS compilados!                                                       #
#[3] - Todos os Pacotes essenciais - INELASTICA                                                                            #
#[4] - Inelastica                                                                                                          #
#                                                                                                                          #
#OBS: Versão Generalizada do Ubuntu e Linux Mint (algumas outras versões derivadas do Debian provavelmente) e WindowsFx.   #
#OBS2: Testes realizados com  Ubuntu: 16.04, 18.04 e 20.04, Linux Mint: 18 e 20, WindowsFx/LinuxFx.                        #
#OBS3: Lembre-se quando terminar de instalar tudo, feche e abra o terminal de novo para poder emular(reload .bashrs)       #
#                                                                                                                          #
#Contatos:                                                                                                                 #
#                                                                                                                          #
#Email: cesar.everlastingtechnologydeveloper@outlook.com                                                                   #
#Whats'app: 91-98439-0419                                                                                                  #
############################################################################################################################

sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/dpkg/lock-frontend

raizInstalacao="$(pwd)"
versionSistema="$(lsb_release -d -s)"
numeracaoSistema="$(lsb_release -r -s)"

echo "SISTEMA $versionSistema\nAdicionando Pacotes Iniciais...\n\n"

sudo dpkg --configure -a
sudo apt install make
sudo apt-get install synaptic -y
sudo apt install yad -y


#################################################----INICIO---BIBLIOTECASESSENCIAIS---SIESTA----#################################################
Instalacao_PacotesEssenciais_Siesta() {
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
    sudo apt-get clean -y
    sudo rm /var/lib/apt/lists/lock
    sudo rm /var/cache/apt/archives/lock
    sudo rm /var/lib/dpkg/lock
    sudo rm /var/lib/dpkg/lock-frontend
    echo "\n\n"

    #Ativando repositorio canoninal e adicionando repositorios
    echo "ativando repositorio canoninal e adicionando repositorios\n\n"
    sudo sed -i.bak "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
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
    echo "\n\n"

    echo "##unzip\n\n"
    sudo apt install unzip -y
    echo "\n\n"

    echo "##python3-tk\n\n"
    sudo apt-get install python3-tk -y
    echo "\n\n"

    echo "##python3\n\n"
    sudo apt-get install python3 -y
    sudo apt-get install python3-dev -y
    echo "\n\n"

    echo "##python3-pip\n\n"
    sudo apt-get install python3-pip -y
    echo "\n\n"

    ####PACOTES A SEREM INSTALADOS####
    echo "#####PACOTES A SEREM INSTALADOS####\n\n"

    #PACOTE gfortran
    echo "#PACOTE gfortran - 1 de 10\n\n"
    sudo apt-get install g++ -y
    sudo apt-get install gfortran -y
    sudo apt-get install gfortran-10 -y
    echo "\n\n"

    #PACOTE m4
    echo "#PACOTE m4 - 2 de 10\n\n"
    sudo apt-get install m4 -y
    echo "\n\n"

    #PACOTE bcc
    echo "#PACOTE bcc - 3 de 10\n\n"
    sudo apt-get install bcc bpfcc-tools -y
    echo "\n\n"

    #PACOTE CCCC
    echo "#PACOTE CCCC - 4 de 10\n\n"
    sudo apt-get install cccc -y
    echo "\n\n"

    #PACOTE fcc
    echo "#PACOTE fcc - 5 de 10\n\n"
    sudo apt-get install fcc -y
    echo "\n\n"

    #PACOTE GPAW e suas dependencias
    echo "#PACOTE GPAW e suas dependencias - 6 de 10\n\n"
    sudo apt install libopenblas-dev libxc-dev libscalapack-mpi-dev libfftw3-dev -y

    ##DEPEDENCIAS VARIADAS DE python e python3
    sudo apt-get install libhdf5-dev -y
    sudo apt-get install python3-numpy python3-scipy python3-matplotlib -y
    sudo apt-get install python3-netcdf4 -y

    sudo apt-get install gpaw -y
    echo "\n\n"

    #PACOTE abinit
    echo "#PACOTE abinit - 7 de 10\n\n"
    sudo apt-get install abinit -y

    pacote=$(dpkg --get-selections | grep abinit)

    if [ -n "$pacote" ]; then
        echo "\n\nPacote $pacote Encontrado"
    elif [ "$(echo "${numeracaoSistema} >= 20.00" | bc)" -eq 1 ] || [ "$versionSistema" = "Windowsfx 10" ] && [ "$(echo "${numeracaoSistema} >= 10.00" | bc)" -eq 1 ]; then
        echo "\n\nPacote $pacote não Encontrado\nBaixando por outras fontes...\n\n"
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/a/abinit/abinit-data_8.10.2-2_all.deb
        sudo dpkg -i abinit-data_8.10.2-2_all.deb
        wget -c http://archive.ubuntu.com/ubuntu/pool/universe/a/abinit/abinit_8.10.2-2_amd64.deb
        sudo dpkg -i abinit_8.10.2-2_amd64.deb
    else
        echo "\nErro: Possivelmente conexão instável, Reinicie a instalação..."
    fi

    echo "\n\n"

    #PACOTE quantum-espresso
    echo "#PACOTE quantum-espresso - 8 de 10\n\n"
    sudo apt-get install quantum-espresso -y
    echo "\n\n"

    #PACOTE meep-lam4
    echo "#PACOTE meep-lam4 - 9 de 10\n\n"
    sudo apt-get install libhdf5-serial-dev -y
    sudo apt-get install hdf5-tools -y
    sudo apt-get install libatlas-base-dev -y
    sudo apt-get install libatlas-ecmwf-utils -y
    sudo apt-get install meep-lam4 -y

    pacote=$(dpkg --get-selections | grep meep-lam4)

    if [ -n "$pacote" ]; then
        echo "\n\nPacote $pacote Encontrado"
    elif [ "$(echo "${numeracaoSistema} >= 20.00" | bc)" -eq 1 ] || [ "$versionSistema" = "Windowsfx 10" ] && [ "$(echo "${numeracaoSistema} >= 10.00" | bc)" -eq 1 ]; then
        echo "\n\nPacote $pacote não Encontrado\nBaixando por outras fontes...\n\n"

        sudo apt-get install guile-3.0 -y
        sudo apt-get install meep -y

    else
        echo "\nErro: Possivelmente conexão instável, Reinicie a instalação..."
    fi
    echo "\n\n"

    #PACOTE GaussSum e suas dependencias
    echo "#PACOTE GaussSum e suas dependencias - 10 de 10\n\n"
    sudo apt-get install gausssum -y
    echo "\n\n"

    #Reatualização de repositorios e bibliotecas
    echo "#Reatualização de repositorios e bibliotecas\n\n"
    sudo apt-get update -y
    sudo apt-get dist-upgrade -y
    echo "\n\n"

    ##FIM DAS INSTALAÇÕES DOS PACOTES ESSENCIAIS
    echo '\033[05;33m"#FIM DAS INSTALAÇÕES DOS PACOTES ESSENCIAIS"\033[00;00m\n\n'
    sleep 3

    cd $raizInstalacao
    sudo chmod -R 777 SIESTA

}
#################################################----FIM---BIBLIOTECASESSENCIAIS---SIESTA----#################################################
                                             ####--------------------------------------------####
#####################################################----INICIO---INSTALADOR---SIESTA----#####################################################
arch_make_UTILS() {

    cp arch.make archSIESTAORIGINAL.bkp

    #CONSTRUINDO O ARCH_MAKE DO SIESTA_UTILS
    echo "#CONSTRUINDO O ARCH_MAKE DO SIESTA_UTILS\n\n"

    cd ..

    cd Util

    sh build_all.sh
    echo "\n\n"

    ###COPIANDO OS PROGRAMAS DA PASTA UTILS DO SIESTA PARA A PASTA BIN DO SISTEMA
    echo "###COPIANDO O PROGRAMA TBtrans DA PASTA UTILS DO SIESTA PARA A PASTA BIN DO SISTEMA\n\n"
    echo '#OBS: Para outros software da pasta "UTILS" entre na pasta do programa e utilize o comando\033[05;33m"sudo cp NomeDoPrograma /usr/local/bin/NomeDoPrograma"\033[00;00m\n\n'
    sleep 3

    #PASTA TBtrans
    echo "#PASTA TBtrans\n\n"
    cd TS/TBtrans
    sudo cp -rf tbtrans /usr/local/bin/tbtrans
}

arch_make() {

    rm arch.make
    make clean
    cp gfortran.make gfortran.bkp

    #CONSTRUINDO O ARCH_MAKE DO GFORTRAN
    echo "#CONSTRUINDO O ARCH_MAKE DO GFORTRAN\n\n"

    sed -i '18s, unknown, SIESTA 4.1 - '"$versionSistema"',' gfortran.make
    sed -i "20s/CC = gcc/CPP = gcc -E -P -x c/" gfortran.make
    sed -i '22s, gfortran, mpif90,' gfortran.make
    sed -i "24s,^,\n,g" gfortran.make
    sed -i '25cFFTW_LIBS = -L\/usr\/lib\/x86_64-linux-gnu -lfftw3f -lfftw3\n' gfortran.make
    sed -i '26cFFTW_INCFLAGS = -I\/usr\/include\n\n' gfortran.make
    sed -i '28cHDF5_LIBS = -L'"$pathSIESTA"'\/siesta-master\/Docs\/build\/lib -lhdf5_hl -lhdf5\n' gfortran.make
    sed -i '29cHDF5_INCFLAGS = -I'"$pathSIESTA"'\/siesta-master\/Docs\/build\/include\n\n' gfortran.make
    sed -i '31cWITH_MPI=1\n' gfortran.make
    sed -i '32cWITH_NETCDF=1\n' gfortran.make
    sed -i '33cWITH_NCDF=1\n\n' gfortran.make
    sed -i '35cNETCDF_LIBS = -L'"$pathSIESTA"'\/siesta-master\/Docs\/build\/lib -lnetcdff -lnetcdf\n' gfortran.make
    sed -i '36cNETCDF_INCFLAGS = -I'"$pathSIESTA"'\/siesta-master\/Docs\/build\/include\n\n' gfortran.make
    sed -i '38cOTHER_LIBS = -L'"$pathSIESTA"'\/siesta-master\/Docs\/build\/lib -lz\n' gfortran.make
    sed -i '40s/FFLAGS = -O2 -fPIC -ftree-vectorize/FFLAGS = -g -O2 $(INCFLAGS) $(NETCDF_INCFLAGS) $(FFTW_INCFLAGS) $(HDF5_INCFLAGS)/' gfortran.make
    sed -i "53s,COMP_LIBS = libsiestaLAPACK.a libsiestaBLAS.a,COMP_LIBS = libncdf.a libfdict.a\n\n\n," gfortran.make
    sed -i "55s/^/LAPACK_LIBS = -llapack -lblas/" gfortran.make

    if [ -e "/usr/lib/x86_64-linux-gnu/libscalapack-openmpi.so" ]; then

        sed -i "56cSCALAPACK_LIBS = /usr/lib/x86_64-linux-gnu/libscalapack-openmpi.so\n\n" gfortran.make
        sed -i '62s/LIBS =/LIBS = $(SCALAPACK_LIBS) $(LAPACK_LIBS) $(INCFLAGS) $(NETCDF_LIBS) $(HDF5_LIBS) $(OTHER_LIBS) $(MPI_LIBS) -fopenmp\n\n\n/' gfortran.make

    elif [ -e "/usr/lib/libscalapack-openmpi.so" ]; then

        sed -i "54cBLACS_LIBS=/usr/lib/libblacs-openmpi.so /usr/lib/libblacsF77init-openmpi.so /usr/lib/libblacsCinit-openmpi.so" gfortran.make
        sed -i "56cSCALAPACK_LIBS = /usr/lib/libscalapack-openmpi.so\n\n" gfortran.make
        sed -i '62s/LIBS =/LIBS = $(SCALAPACK_LIBS) $(LAPACK_LIBS) $(BLACS_LIBS) $(INCFLAGS) $(NETCDF_LIBS) $(HDF5_LIBS) $(OTHER_LIBS) $(MPI_LIBS) -fopenmp\n\n\n/' gfortran.make

    else
        echo " Caminhos não encontrados"
    fi

    sed -i "58cFPPFLAGS_CDF = -DNCDF -DNCDF_4 -DCDF" gfortran.make
    sed -i '60cFPPFLAGS = $(FPPFLAGS_MPI) $(DEFS_PREFIX) $(FPPFLAGS_CDF) -DFC_HAVE_ABORT -DMPI -DFC_HAVE_FLUSH -DGFORTRAN -DGRID_DP -DPHI_GRID_SP -DUSE_GEMM3m' gfortran.make
    sed -i "64s/^/MPI_INTERFACE = libmpi_f90.a/" gfortran.make
    sed -i "65s/^/MPI_INCLUDE = ./" gfortran.make
    sed -i "69s/FFLAGS_DEBUG = -g -O1/FFLAGS_DEBUG = -g -O0/" gfortran.make

    cp gfortran.make arch.make
    rm gfortran.make
    cp gfortran.bkp gfortran.make
    rm gfortran.bkp

    ###ARCH_MAKE DO GFORTRAN CRIADO
    echo "##ARCH_MAKE DO GFORTRAN CRIADO\n\n"

    ######iNSTALANDO SIESTA4.1
    echo "###INSTALANDO SIESTA\n\n"
    make

    if [ "$emulacaoSiesta" = "" ]; then
        sudo cp -rf siesta /usr/local/bin/siesta
    else
        sudo cp siesta $emulacaoSiesta
        sudo mv $emulacaoSiesta /usr/local/bin
    fi
    
    #sudo cp -rf siesta /usr/local/bin/siesta
    echo "\n\n"

    #REFERÊNCIA NO .bashrc
    cd ${HOME}
    sudo sed -i '$ { s/^.*$/&\n\n#netcdf/ }' ~/.bashrc
    sudo sed -i '$ { s|^.*$|&\nLD_LIBRARY_PATH=$LD_LIBRARY_PATH:'"$pathSIESTA"'/siesta-master/Docs/build/lib\nexport LD_LIBRARY_PATH| }' ~/.bashrc
    sudo sed -i '$ { s|^.*$|&\nINCLUDE=$INCLUDE:'"$pathSIESTA"'/siesta-master/Docs/build/include\nexport INCLUDE| }' ~/.bashrc

    cd /home/$(users)
    sudo sed -i '$ { s/^.*$/&\n\n##netcdf/ }' .bashrc
    sudo sed -i '$ { s|^.*$|&\nLD_LIBRARY_PATH=$LD_LIBRARY_PATH:'"$pathSIESTA"'/siesta-master/Docs/build/lib\nexport LD_LIBRARY_PATH| }' .bashrc
    sudo sed -i '$ { s|^.*$|&\nINCLUDE=$INCLUDE:'"$pathSIESTA"'/siesta-master/Docs/build/include\nexport INCLUDE| }' .bashrc

    cd $raizInstalacao/SIESTA/PackageSIESTA/siesta-master/Obj

}

Instalacao_PacotesSiesta() {

    wget -c https://gitlab.com/siesta-project/siesta/-/archive/master/siesta-master.tar.gz
    tar -vzxf siesta-master.tar.gz
    pathSIESTA="$(pwd)"
    #Escrevendo arquivo gfortran.make
    echo "#Escrevendo arquivo gfortran.make\n\n"

    tar vxf siesta-master.tar.gz -C $pathSIESTA siesta-master/Obj/gfortran.make
    echo "\n\n"

    #./install_netcdf4.bash
    echo "#./install_netcdf4.bash\n\n"
    cd siesta-master/Docs

    echo '\n\nOBS: Existe a possibilidade de aparecer o termo \033[32mtee: saída padrão: Recurso temporariamente indisponível"\033[00m no processo ./install_netcdf4.bash, Apenas aguarde, pois está sendo efetuado testes para a biblioteca HDF5, quando terminar o processo, a visualização de instalação do SIESTA continuará neste terminal.\n\nOBS2: Pode ser visto o processo de testes do HDF5 em \033[05;33m"install_netcdf4.log"\033[00;00m na pasta siesta-master/Docs\n\n'
    echo "Iniciando em:\n"
    for tempo in $(seq 30 -1 0); do
        echo $tempo"..."
        sleep 1
    done
    echo "\n\n"

    (./install_netcdf4.bash 2>&1) | tee install_netcdf4.log
    echo "\n\n"

    cd ..
    cd Obj
    sh ../Src/obj_setup.sh
    arch_make

    ###COMPILANDO TODOS OS PROGRAMAS DA PASTA UTILS DO SIESTA
    echo "###COMPILANDO TODOS OS PROGRAMAS DA PASTA UTILS DO SIESTA\n\n"

    arch_make_UTILS

    echo "TERMÍNO DAS COPIAS\n\n"

    ##TERMÍNO DA INSTALAÇÃO DO SIESTA/TRANSIESTA
    echo "#TERMÍNO DA INSTALAÇÃO DO SIESTA/TRANSIESTA\n\n"
    sleep 3

    cd $raizInstalacao
    sudo chmod -R 777 SIESTA
}


InstalacaoPacotesEssenciaisSiestaIntermediario() {

    if [ -e "SIESTA/PackageEssenciais" ] && [ "$PESiesta" = "TRUE" ]; then
        echo 'O DIRETÓRIO \033[32mPackageEssenciais"\033[00m EXISTE
        \n\n MUDANDO O DIRETÓRIO ATUAL PARA: \033[05;33m"PackageEssenciais"\033[00;00m\n\n'
        sleep 2
        cd SIESTA/PackageEssenciais
        Instalacao_PacotesEssenciais_Siesta

    else
        if [ "$PESiesta" = "TRUE" ]; then
            echo 'O DIRETÓRIO \033[32m"PackageEssenciais"\033[00m NÃO EXISTE
            \n\n CRIANDO O DIRETÓRIO: \033[05;33m"PackageEssenciais"\033[00;00m\n\n'
            sleep 2
            mkdir -p SIESTA/PackageEssenciais
            cd SIESTA/PackageEssenciais
            Instalacao_PacotesEssenciais_Siesta
        else
            echo ""
        fi
    fi

    if [ -e "SIESTA/PackageSIESTA" ] && [ "$PSiesta" = "TRUE" ]; then
        echo 'O DIRETÓRIO \033[32mPackageSIESTA"\033[00m EXISTE
        \n\n MUDANDO O DIRETÓRIO ATUAL PARA: \033[05;33m"PackageSIESTA"\033[00;00m\n\n'
        sleep 2
        cd SIESTA/PackageSIESTA
        Instalacao_PacotesSiesta
    else
        if [ "$PSiesta" = "TRUE" ]; then
            echo 'O DIRETÓRIO \033[32m"PackageSIESTA"\033[00m NÃO EXISTE
            \n\n CRIANDO O DIRETÓRIO: \033[05;33m"PackageSIESTA"\033[00;00m\n\n'
            sleep 2
            mkdir -p SIESTA/PackageSIESTA
            cd SIESTA/PackageSIESTA
            Instalacao_PacotesSiesta
        else
            echo ""
        fi
    fi
}
#####################################################----FIM---INSTALADOR---SIESTA----#####################################################

Instalacao_PacotesEssenciais_Inelastica() {

    sudo apt-get install python-scipy python-matplotlib python-netcdf4 -y
    pacote=$(dpkg --get-selections | grep python-scipy)
    pacote2=$(dpkg --get-selections | grep python-matplotlib)
    pacote3=$(dpkg --get-selections | grep python-netcdf4)

    if [ -n "$pacote" ] && [ -n "$pacote2" ] && [ -n "$pacote3" ]; then
        sudo apt-get install python-tk -y
        sudo apt-get install python-numpy -y
        sudo apt-get install python -y
        sudo apt-get install python-dev -y
        echo "\n\nPacotes $pacote $pacote2 $pacote3 Encontrados\n\n"
        apt-mark hold libpython-dbg libpython-dev python python-dbg python-dev python-h5py python-mpi4py python-netcdf4 python-numpy-dbg python-scipy python-scipy-dbg
    elif [ "$(echo "${numeracaoSistema} >= 20.00" | bc)" -eq 1 ] || [ "$versionSistema" = "Windowsfx 10" ] && [ "$(echo "${numeracaoSistema} >= 10.00" | bc)" -eq 1 ]; then
        echo "\n\nPacotes $pacote $pacote2 $pacote3 não Encontrados\nBaixando por outras fontes...\n\n"

        wget -c https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz
        tar -xvzf Python-2.7.18.tgz
        cd Python-2.7.18
        ./configure
        make install
        cd ..

        sudo apt-get install gnuplot -y
        sudo apt-get install python2-dbg -y
        sudo apt install python-numpy -y

        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/e/elpa/libelpa4_2016.05.001-6build1_amd64.deb
        sudo dpkg -i libelpa4_2016.05.001-6build1_amd64.deb
        wget -c http://archive.ubuntu.com/ubuntu/pool/universe/e/elpa/libelpa-dev_2016.05.001-6build1_amd64.deb
        sudo dpkg -i libelpa-dev_2016.05.001-6build1_amd64.deb
        wget -c http://ftp.us.debian.org/debian/pool/main/p/python-setuptools/python-pkg-resources_44.0.0-3_all.deb
        sudo dpkg -i python-pkg-resources_44.0.0-3_all.deb
        wget -c http://ftp.us.debian.org/debian/pool/main/p/python-numpy/python-numpy_1.16.2-1_amd64.deb
        sudo dpkg -i python-numpy_1.16.2-1_amd64.deb
        wget -c http://ftp.us.debian.org/debian/pool/main/u/underscore/libjs-underscore_1.9.1~dfsg-1_all.deb
        sudo dpkg -i libjs-underscore_1.9.1~dfsg-1_all.deb
        wget -c http://ftp.us.debian.org/debian/pool/main/s/sphinx/libjs-sphinxdoc_1.8.4-1_all.deb
        sudo dpkg -i libjs-sphinxdoc_1.8.4-1_all.deb
        wget -c http://ftp.us.debian.org/debian/pool/main/p/python-numpy/python-numpy-doc_1.16.2-1_all.deb
        sudo dpkg -i python-numpy-doc_1.16.2-1_all.deb

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
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/p/python-decorator/python-decorator_4.3.0-1.1_all.deb
        sudo dpkg -i python-decorator_4.3.0-1.1_all.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/p/python-scipy/python-scipy_1.2.2-4_amd64.deb
        sudo dpkg -i python-scipy_1.2.2-4_amd64.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/p/python-scipy/python-scipy-dbg_1.2.2-4_amd64.deb
        sudo dpkg -i python-scipy-dbg_1.2.2-4_amd64.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/m/mathjax/fonts-mathjax_2.7.4+dfsg-1_all.deb
        sudo dpkg -i fonts-mathjax_2.7.4+dfsg-1_all.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/m/mathjax/libjs-mathjax_2.7.4+dfsg-1_all.deb
        sudo dpkg -i libjs-mathjax_2.7.4+dfsg-1_all.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/p/python-scipy/python-scipy-doc_1.2.2-4_all.deb
        sudo dpkg -i python-scipy-doc_1.2.2-4_all.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/libh/libhdf4/libhdf4-0_4.2.10-3.2_amd64.deb
        sudo dpkg -i libhdf4-0_4.2.10-3.2_amd64.deb
        wget -c http://security.ubuntu.com/ubuntu/pool/main/g/glibc/multiarch-support_2.23-0ubuntu11.2_amd64.deb
        sudo dpkg -i multiarch-support_2.23-0ubuntu11.2_amd64.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/libm/libmatheval/libmatheval1_1.1.11+dfsg-2_amd64.deb
        sudo dpkg -i libmatheval1_1.1.11+dfsg-2_amd64.deb
        wget -c http://ppa.launchpad.net/linuxuprising/libpng12/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1+1~ppa0~focal_amd64.deb
        sudo dpkg -i libpng12-0_1.2.54-1ubuntu1.1+1~ppa0~focal_amd64.deb
        wget -c http://security.ubuntu.com/ubuntu/pool/main/g/gcc-5/gcc-5-base_5.4.0-6ubuntu1~16.04.12_amd64.deb
        sudo dpkg -i gcc-5-base_5.4.0-6ubuntu1~16.04.12_amd64.deb
        wget -c http://security.ubuntu.com/ubuntu/pool/main/g/gcc-5/libgfortran3_5.4.0-6ubuntu1~16.04.12_amd64.deb
        sudo dpkg -i libgfortran3_5.4.0-6ubuntu1~16.04.12_amd64.deb
        wget -c http://security.ubuntu.com/ubuntu/pool/universe/h/hdf5/libhdf5-10_1.8.16+docs-4ubuntu1.1_amd64.deb
        sudo dpkg -i libhdf5-10_1.8.16+docs-4ubuntu1.1_amd64.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/h5utils/h5utils_1.12.1-4_amd64.deb
        sudo dpkg -i h5utils_1.12.1-4_amd64.deb
        wget -c http://archive.ubuntu.com/ubuntu/pool/universe/s/sip4/python3-sip_4.19.21+dfsg-1build1_amd64.deb
        sudo dpkg -i python3-sip_4.19.21+dfsg-1build1_amd64.deb
        wget -c http://archive.ubuntu.com/ubuntu/pool/universe/w/wxpython4.0/python3-wxgtk4.0_4.0.7+dfsg-2build1_amd64.deb
        sudo dpkg -i python3-wxgtk4.0_4.0.7+dfsg-2build1_amd64.deb
        wget -c http://archive.ubuntu.com/ubuntu/pool/universe/m/mpi4py/python3-mpi4py_3.0.3-4build2_amd64.deb
        sudo dpkg -i python3-mpi4py_3.0.3-4build2_amd64.deb
        wget -c http://archive.ubuntu.com/ubuntu/pool/universe/h/h5py/python3-h5py_2.10.0-2build2_amd64.deb
        sudo dpkg -i python3-h5py_2.10.0-2build2_amd64.deb
        wget -c http://archive.ubuntu.com/ubuntu/pool/universe/h/hdf-compass/python3-hdf-compass_0.7~b8-2_all.deb
        sudo dpkg -i python3-hdf-compass_0.7~b8-2_all.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hdf-compass/hdf-compass_0.7~b8-2_all.deb
        sudo dpkg -i hdf-compass_0.7~b8-2_all.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hdf-compass/hdf-compass-doc_0.7~b8-2_all.deb
        sudo dpkg -i hdf-compass-doc_0.7~b8-2_all.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hdf5/libhdf5-openmpi-dev_1.10.4+repack-11ubuntu1_amd64.deb
        sudo dpkg -i libhdf5-openmpi-dev_1.10.4+repack-11ubuntu1_amd64.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hdf5/libhdf5-mpi-dev_1.10.4+repack-11ubuntu1_amd64.deb
        sudo dpkg -i libhdf5-mpi-dev_1.10.4+repack-11ubuntu1_amd64.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hwloc/hwloc-nox_2.1.0+dfsg-4_amd64.deb
        sudo dpkg -i hwloc-nox_2.1.0+dfsg-4_amd64.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/m/mpich/libmpich12_3.3.2-2build1_amd64.deb
        sudo dpkg -i libmpich12_3.3.2-2build1_amd64.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hdf5/libhdf5-mpich-103_1.10.4+repack-11ubuntu1_amd64.deb
        sudo dpkg -i libhdf5-mpich-103_1.10.4+repack-11ubuntu1_amd64.deb
        wget -c http://archive.ubuntu.com/ubuntu/pool/universe/m/mpich/mpich_3.3.2-2build1_amd64.deb
        sudo dpkg -i mpich_3.3.2-2build1_amd64.deb
        wget -c http://archive.ubuntu.com/ubuntu/pool/universe/m/mpich/libmpich-dev_3.3.2-2build1_amd64.deb
        sudo dpkg -i libmpich-dev_3.3.2-2build1_amd64.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hdf5/libhdf5-mpich-dev_1.10.4+repack-11ubuntu1_amd64.deb
        sudo dpkg -i libhdf5-mpich-dev_1.10.4+repack-11ubuntu1_amd64.deb
        wget -c http://mirrors.kernel.org/ubuntu/pool/universe/h/hdf5/libhdf5-doc_1.10.0-patch1+docs-4_all.deb
        sudo dpkg -i libhdf5-doc_1.10.0-patch1+docs-4_all.deb
        sudo apt-get install python-tk -y
        apt-mark hold libpython-dbg libpython-dev python python-cftime python-dbg python-dev python-h5py python-mpi4py python-netcdf4 python-numpy-dbg python-scipy python-scipy-dbg python2-dbg python2-dev
    else
        echo "\nErro: Possivelmente conexão instável, Reinicie a instalação..."
    fi

    cd $raizInstalacao
    sudo chmod -R 777 INELASTICA
}

Instalacao_PacotesInelastica() {

    ###INSTALAÇÃO DO INELASTICA 446
    echo "###INSTALAÇÃO DO INELASTICA\n\n"

    # instalar destino de inelastica
    wget -c https://sourceforge.net/projects/inelastica/files/latest/download
    sudo unzip -o download
    cd inelastica-code-446
    rm -r build
    sudo python setup.py build --fcompiler=gfortran
    pathInelastica="/usr/local/software/Inelastica"
    sudo python setup.py install --prefix=$pathInelastica

    #REFERÊNCIA NO .bashrc
    cd ${HOME}
    sudo sed -i '$ { s/^.*$/&\n\n#INELASTICA446/ }' ~/.bashrc
    sudo sed -i '$ { s|^.*$|&\nPYTHONPATH=$PYTHONPATH:'"$pathInelastica"'/lib/python2.7/site-packages\nexport PYTHONPATH| }' ~/.bashrc
    sudo sed -i '$ { s|^.*$|&\nPATH=$PATH:'"$pathInelastica"'/bin\nexport PATH| }' ~/.bashrc

    cd /home/$(users)
    sudo sed -i '$ { s/^.*$/&\n\n#INELASTICA446/ }' .bashrc
    sudo sed -i '$ { s|^.*$|&\nPYTHONPATH=$PYTHONPATH:'"$pathInelastica"'/lib/python2.7/site-packages\nexport PYTHONPATH| }' .bashrc
    sudo sed -i '$ { s|^.*$|&\nPATH=$PATH:'"$pathInelastica"'/bin\nexport PATH| }' .bashrc

    #TERMÍNO DA INSTALAÇÃO DO INELASTICA
    echo "#\n\nOBS: FECHAR O TERMINAL E EMULAR OUTRO PARA RECARREGAR A FUNÇÃO DO .BARSCH\n\n"
    echo "#TERMÍNO DA INSTALAÇÃO DO INELASTICA\n\n"

    sleep 3

    cd $raizInstalacao
    sudo chmod -R 777 INELASTICA
}

InstalacaoPacotesEssenciaisInelasticaIntermediario() {

    if [ -e "INELASTICA/PackageEssenciais" ] && [ "$PEInelastica" = "TRUE" ]; then
        echo 'O DIRETÓRIO \033[32mPackageEssenciais"\033[00m EXISTE
        \n\n MUDANDO O DIRETÓRIO ATUAL PARA: \033[05;33m"PackageEssenciais"\033[00;00m\n\n'
        sleep 2
        cd INELASTICA/PackageEssenciais
        Instalacao_PacotesEssenciais_Inelastica

    else
        if [ "$PEInelastica" = "TRUE" ]; then
            echo 'O DIRETÓRIO \033[32m"PackageEssenciais"\033[00m NÃO EXISTE
            \n\n CRIANDO O DIRETÓRIO: \033[05;33m"PackageEssenciais"\033[00;00m\n\n'
            sleep 2
            mkdir -p INELASTICA/PackageEssenciais
            cd INELASTICA/PackageEssenciais
            Instalacao_PacotesEssenciais_Inelastica
        else
            echo ""
        fi
    fi

    if [ -e "INELASTICA/PackagesINELASTICA" ] && [ "$PInelastica" = "TRUE" ]; then
        echo 'O DIRETÓRIO \033[32mPackagesINELASTICA"\033[00m EXISTE
        \n\n MUDANDO O DIRETÓRIO ATUAL PARA: \033[05;33m"PackagesINELASTICA"\033[00;00m\n\n'
        sleep 2
        cd INELASTICA/PackagesINELASTICA
        Instalacao_PacotesInelastica
    else
        if [ "$PInelastica" = "TRUE" ]; then
            echo 'O DIRETÓRIO \033[32m"PackagesINELASTICA"\033[00m NÃO EXISTE
            \n\n CRIANDO O DIRETÓRIO: \033[05;33m"PackagesINELASTICA"\033[00;00m\n\n'
            sleep 2
            mkdir -p INELASTICA/PackagesINELASTICA
            cd INELASTICA/PackagesINELASTICA
            Instalacao_PacotesInelastica
        else
            echo ""
        fi
    fi
}

Main() {

    ####INICIANDO SISTEMA####
    echo '\033[05;37m                              ####INICIANDO SISTEMA####\033[00;00m\n\n'

    sleep 3

    github=$(
        yad --form --title "DEVELOPER" --buttons-layout=center --button=READY:0 \
        --image="$raizInstalacao/res/img/IronGit.png" --image-on-top \
        --text "Developer: Júlio César Reis da Silva\nGithub: https://github.com/Reis-Silva\nLicence: Open-Source\n\n
	        Page: https://github.com/Reis-Silva/Install_Use-Siesta-Transiesta-Inelastica\n\nTestes realizados com Ubuntu: 16.04, 18.04 e 20.04, Linux Mint: 18 e 20, WindowsFX/LinuxFX.\n\n" --text-align=center
    )

    observacoes=$(
        yad  --title "OBSERVAÇÕES" --form --center --buttons-layout=center --button=READY:0\
        --width=1200 --height=10 \
        --image="$raizInstalacao/res/img/Observacao.jpg" --image-on-top --width=1200 --height=10 \
        --text "OBS: Na Opção 'INSTALAÇÃO SIESTA/TRANSIESTA', EXISTE A POSSIBILIDADE DE APARECER O TERMO: tee: 'saída padrão': Recurso temporariamente indisponível no PROCESSO ./install_netcdf4.bash, apenas aguarde, pois está sendo efetuado testes para a biblioteca HDF5, quando terminar o processo, a visualização de instalação do SIESTA continuará no terminal. Pode ser visto o processo de testes do HDF5 em 'install_netcdf4.log' na pasta siesta-master/Docs\n\nOBS2: Lembre-se quando terminar de instalar tudo, feche e abra o terminal novamente para poder emular(reload .bashrs).\n\n " --text-align=fill
    )

    while :; do

        instalacao=$(
            yad --form --title "INSTALAÇÃO SIESTA/TRANSIESTA/INELASTICA" \
            --image="$raizInstalacao/res/img/SIESTA_INELASTICA.png" --image-on-top \
            --text "VERSION: Siesta-master v4.1 - 262\nLINK: https://gitlab.com/siesta-project/siesta 
    		\nVERSION: Inelastica v1.3.6\nLINK: http://https://tfrederiksen.github.io/inelastica/docs/latest/index.html\n" --text-align=center \
            --field="INSTALAÇÃO - PACOTES ESSENCIAIS - SIESTA":CHK \
            --field="INSTALAÇÃO - SIESTA/TRANSIESTA":CHK \
            --field "Ajuste um nome de preferência para a emulação do SIESTA (Nome PADRÃO: Siesta):" \
            --field="INSTALAÇÃO - PACOTES ESSENCIAIS - INELASTICA":CHK \
            --field="INSTALAÇÃO - INELASTICA":CHK \
            --buttons-layout=end --button="gtk-close":1 --button=" INSTALAR!.icons/te.png":2
        )

        escolha=$(echo $?)
        PESiesta=$(echo "$instalacao" | cut -d "|" -f 1)
        PSiesta=$(echo "$instalacao" | cut -d "|" -f 2)
        emulacaoSiesta=$(echo "$instalacao" | cut -d "|" -f 3)
        PEInelastica=$(echo "$instalacao" | cut -d "|" -f 4)
        PInelastica=$(echo "$instalacao" | cut -d "|" -f 5)

        if [ "$PESiesta" = "TRUE" ] || [ "$PSiesta" = "TRUE" ]; then
            InstalacaoPacotesEssenciaisSiestaIntermediario
        else
            echo ""
        fi

        if [ "$PEInelastica" = "TRUE" ] || [ "$PInelastica" = "TRUE" ]; then
            InstalacaoPacotesEssenciaisInelasticaIntermediario
        else
            echo ""
        fi

        if [ "$PESiesta" = "TRUE" ] || [ "$PSiesta" = "TRUE" ] || [ "$PEInelastica" = "TRUE" ] || [ "$PInelastica" = "TRUE" ]; then
            exit
        else
            echo ""
        fi

        if [ "$escolha" = 1 ] || [ "$escolha" = 252 ]; then
            exit
        else
            echo ""
        fi

        if [ "$PESiesta" = "FALSE" ] && [ "$PSiesta" = "FALSE" ] && [ "$PEInelastica" = "FALSE" ] && [ "$PInelastica" = "FALSE" ]; then
            yad --width 325 --height 50 --title "ERROR" --image=dialog-question --buttons-layout=center --button=OK:0 --text="ESCOLHA UMA OPÇÃO DE INSTALAÇÃO"
        else
            echo ""
        fi

    done

}

Main
