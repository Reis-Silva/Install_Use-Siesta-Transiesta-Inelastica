# Install_Use-Siesta-Transiesta-Inelastica

## Instalação dos softwares Siesta/Transiesta/Inelastica:

--- Instalação original para UBUNTU 20.04

--- Versões SIESTA v4.1-260/INELASTICA v1.3.6

Link Install YOUTUBE: https://www.youtube.com/watch?v=af9cmUdHDJ8

## Opções de instalação completa na interface do programa:
[1] - Todos os Pacotes essenciais

[2] - Siesta/Transiesta - OBS: Todos os programas UTILS compilados!

[3] - Inelastica

## Observações:
OBS: Versão beta FINAL de instalação, pode ocorrer erros para outras versões do UBUNTU, ainda não foi testado.

OBS2: Instalação efetuada com todas as opções, sendo o sistema no inicio apenas com atualizações de terceiros e upgrade do proprio do sistema.

OBS3: Para instalação das opções [2] e [3] em versões entre "v.16.04 < v.xx.xx < v.20.04", os PACOTES ESSENCIAIS devem ser instaladas separadamente e antes destas instalações.

OBS4: Para instalação das opções [2] e [3] em versões "v.xx.xx < v.17.04" do ubuntu, é preciso alterar os diretórios no arquivo shell script catalogados como  "/usr/lib/x86_64-linux-gnu/" para "/usr/lib/". Os PACOTES ESSENCIAIS devem ser instaladas separadamente e antes destas instalações.

## INSTALAÇÃO:

1 - ENTRAR NO TERMINAL ONDE ESTÁ LOCALIZADO O ARQUIVO "Install_Use-Siesta-Transiesta-Inelastica.sh", ENTRE NO MODO ROOT DO SISTEMA "sudo su", E INSTALE COM O COMANDO "sh Install_Use-Siesta-Transiesta-Inelastica.sh".

2 - SELECIONAR AS OPÇÕES DE INSTALAÇÃO E APERTE INSTALAR

FIM

OBS: NA OPÇÃO DE INSTALAÇÃO "PACOTES ESSENCIAIS" HAVERÁ "DOWNGRADE" EM BIBLIOTECAS, NO ENTANTO SERÃO ATUALIZADAS NOVAMENTE.

OBS2: SE NÃO HOUVER INSTALAÇÃO DOS "PACOTES ESSENCIAIS", ENCONTRE-SE CORRETO PARA QUE A INSTALAÇÃO DAS DEMAIS OPÇÕES SEJA FEITA CORRETAMENTE. 


## EMULAÇÃO DE NUCLEOS PARALELOS

1 - NA OPÇÃO PARA USAR DIVERSOS NUCLEOS EXISTENTES NO COMPUTADOR SEM INTERRUPÇÕES, UTILIZAR A FUNÇÃO "--oversubscribe"

EXEMPLO:

"mpirun --oversubscribe -np 4 siesta < INPUT.fdf  | tee OUTPUT.fdf" 

[1] - mpirun = Emulação do compilador.

[2] - --oversubscribe = Utilização para todos os nucleos existentes.

[3] - -np 4 = Escolha do Numero de Núcleos para emular.

[4] - siesta < INPUT.fdf  | tee OUTPUT.fdf  = Emulação do comando do Software para arquivo de entrar e saida.

####################################################################################################################################################################################################################




### Deixar comentários e Likes para iniciar operação de upgrade dos instaladores.

### []´s





####################################################################################################################################################################################################################
# Install-Use-Siesta-Transiesta-Inelastica

## Siesta / Transiesta / Inelastica software installation:

--- Original installation for UBUNTU 20.04

--- SIESTA versions v4.1-260 / INELASTICA v1.3.6

## Full installation options in the program interface:
[1] - All Essential Packages

[2] - Siesta/Transiesta - NOTE: All UTILS programs compiled!

[3] - Inelastica

## Comments:
NOTE: FINAL beta version of installation, errors may occur for other versions of UBUNTU, not yet tested.

NOTE2: Installation performed with all options, with the system started only with third-party updates and update from the system owner.

NOTE3: For installation of options [2] and [3] in versions between "v.16.04 < v.xx.xx < v.20.04", the ESSENTIAL PACKAGES must be installed quickly and before these installations.

NOTE4: To install options [2] and [3] in ubuntu versions "v.xx.xx < v.17.04", it is necessary to change the directories in the catalog shell script file cataloged as "/usr/lib/x86_64-linux-gnu/" to "/usr/lib/". ESSENTIAL PACKAGES must be installed and before these installations.

## INSTALLATION:

1 - ENTER THE TERMINAL WHERE THE FILE "Install_Use-Siesta-Transiesta-Inelastica.sh" IS LOCATED, ENTER THE ROOT MODE OF THE SYSTEM "sudo su", AND INSTALL WITH THE COMMAND "sh Install_Use-Siesta-Transiesta-Inelastica.sh" .

2 - SELECT INSTALLATION OPTIONS AND TIGHTEN INSTALL

END

NOTE: IN THE INSTALLATION OPTION "ESSENTIAL PACKAGES" THERE WILL BE "DOWNGRADE" IN LIBRARIES, HOWEVER WILL BE UPDATED AGAIN.

NOTE2: IF THERE IS NO INSTALLATION OF THE "ESSENTIAL PACKAGES", FIND YOURSELF SO THAT THE INSTALLATION OF THE OTHER OPTIONS IS DONE CORRECTLY.


## PARALLEL NUCLEUS EMULATION

1 - IN THE OPTION TO USE VARIOUS NUCLEUS EXISTING ON THE COMPUTER WITHOUT INTERRUPTIONS, USE THE "--oversubscribe" FUNCTION

EXAMPLE:

"mpirun --oversubscribe -np 4 siesta <INPUT.fdf | tee OUTPUT.fdf"

[1] - mpirun = Compiler emulation.

[2] - --oversubscribe = Use for all existing cores.

[3] - -np 4 = Choose the number of cores to emulate.

[4] - siesta <INPUT.fdf | tee OUTPUT.fdf = Software command emulation for input and output file.

####################################################################################################################################################################################################################




### Leave comments and Likes to start the installers upgrade operation.

### []'s
