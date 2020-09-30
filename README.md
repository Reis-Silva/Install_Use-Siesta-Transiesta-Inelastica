# Install_Use-Siesta-Transiesta-Inelastica

## Instalação dos softwares Siesta/Transiesta/Inelastica:

--- Versões SIESTA v4.1-262/INELASTICA v1.3.6


<p align="center">
  <b>Link YouTube:</b><br>
  <a href="http://www.youtube.com/watch?v=af9cmUdHDJ8">01 - Install SIESTA/Inelastica com Interface</a> |
  <br><br>
  <img src="http://img.youtube.com/vi/af9cmUdHDJ8/0.jpg">
</p>

<p align="center">
 ===========================================================================
</p>

<p align="center">
  <b>Link YouTube:</b><br>
  <a href="https://www.youtube.com/watch?v=2pTLMxiM1GY">02 - UPDATE - Install SIESTA/Inelastica com Interface</a> |
  <br><br>
  <img src="http://img.youtube.com/vi/2pTLMxiM1GY/0.jpg">
</p>
<p align="center">
 ===========================================================================
</p>

<p align="center">
  <b>Link YouTube:</b><br>
  <a href="https://www.youtube.com/watch?v=R_09pLtj0NY">03 - Install SIESTA e Use no WindowsFX/LinuxFx (e outros)</a> |
  <br><br>
  <img src="http://i3.ytimg.com/vi/R_09pLtj0NY/hqdefault.jpg">
</p>

## Opções de instalação completa na interface do programa:
[1] - INSTALAÇÃO - PACOTES ESSENCIAIS - SIESTA

[2] - INSTALAÇÃO - SIESTA/TRANSIESTA - OBS: Todos os programas UTILS compilados!

[3] - INSTALAÇÃO - PACOTES ESSENCIAIS - INELASTICA

[4] - INSTALAÇÃO - INELASTICA

#### Início:
<p align="center">
<img src="https://github.com/Reis-Silva/Install_Use-Siesta-Transiesta-Inelastica/blob/master/Install/res/ReferenceImage/Developer.png">
</p>

#### OBSERVAÇÕES:
<p align="center">
<img src="https://github.com/Reis-Silva/Install_Use-Siesta-Transiesta-Inelastica/blob/master/Install/res/ReferenceImage/Observacao.png">
</p>

#### Opções de Instalação:
<p align="center">
<img src="https://github.com/Reis-Silva/Install_Use-Siesta-Transiesta-Inelastica/blob/master/Install/res/ReferenceImage/Install.png">
</p>

## Observações:

##### OBS: Versão Generalizada do Ubuntu e Linux Mint (algumas outras versões derivadas do Debian provavelmente).

##### OBS2: Testes realizados com  Ubuntu: 16.04, 18.04 e 20.04, Linux Mint: 18 e 20, WindowsFx/LinuxFx.

##### OBS3: Lembre-se quando terminar de instalar tudo, feche e abra o terminal de novo para poder emular (reload .bashrs).

## INSTALAÇÃO:

##### 1 - ENTRAR NO TERMINAL ONDE ESTÁ LOCALIZADO O ARQUIVO "Install_Use-Siesta-Transiesta-Inelastica.sh", ENTRE NO MODO ROOT DO SISTEMA "sudo su", E INSTALE COM O COMANDO "sh Install_Use-Siesta-Transiesta-Inelastica.sh".

##### 2 - SELECIONAR AS OPÇÕES DE INSTALAÇÃO E APERTE INSTALAR.

FIM

##### OBS: NA OPÇÃO DE INSTALAÇÃO "PACOTES ESSENCIAIS" HAVERÁ "DOWNGRADE" EM BIBLIOTECAS, NO ENTANTO SERÃO ATUALIZADAS NOVAMENTE.

##### OBS2: SE NÃO HOUVER INSTALAÇÃO DOS "PACOTES ESSENCIAIS", ENCONTRE-SE CORRETO PARA QUE A INSTALAÇÃO DAS DEMAIS OPÇÕES SEJA FEITA CORRETAMENTE. 

##### OBS3: NA OPÇÃO "INSTALAÇÃO SIESTA/TRANSIESTA", EXISTE A POSSIBILIDADE DE APARECER O TERMO: "tee: 'saída padrão': Recurso temporariamente indisponível" NO PROCESSO ./install_netcdf4.bash, apenas aguarde, pois está sendo efetuado testes para a biblioteca HDF5, quando terminar o processo, a visualização de instalação do SIESTA continuará no terminal. Pode ser visto o processo de testes do HDF5 em "install_netcdf4.log" na pasta siesta-master/Docs.

## EMULAÇÃO DE NUCLEOS PARALELOS

##### 1 - NA OPÇÃO PARA USAR DIVERSOS NUCLEOS EXISTENTES NO COMPUTADOR SEM INTERRUPÇÕES, UTILIZAR A FUNÇÃO "--oversubscribe"

EXEMPLO:

"mpirun --oversubscribe -np 4 siesta < INPUT.fdf  | tee OUTPUT.fdf" 

[1] - mpirun = Emulação do compilador.

[2] - --oversubscribe = Utilização para todos os nucleos existentes.

[3] - -np 4 = Escolha do Numero de Núcleos para emular.

[4] - siesta < INPUT.fdf  | tee OUTPUT.fdf  = Emulação do comando do Software para arquivo de entrar e saida.

########################################################################################################################################################################################


### Deixar comentários e Likes para iniciar operação de upgrade dos instaladores.

### []´s
