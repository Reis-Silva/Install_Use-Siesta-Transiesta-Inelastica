# Uso dos sofwares Siesta/Transiesta/Inelastica:

## MODELOS DE SCRIPTS SIESTA:

### Pasta: 1_K-point:

[1] - Emular.sh - CALCULAR K-POINT DA ESTRUTURA: GERAÇÃO DE TSHS DOS ELETRODOS

### Pasta: 2_Otimização

[1] - EMULAR.sh - OTIMIZAR A ESTRUTURA

### Pasta: 3_K-point-Recalcular

[1] - EMULAR.sh -  RECALCULAR K-POINT DA ESTRUTURA: GERAÇÃO DE TSHS DOS ELETRODOS (DEPOIS DA OTIMIZAÇÃO BASEADO NO PRIMEIRO K-POINT)

[2] - get_energy_and_K-point.sh - Armazenas os resultado no arquivo energy_vs_K-point.dat

[3] - K-point_estrutura.sh - SCRIPT A PARTE DO RECALCULO DE K-POINT DA ESTRUTURA: GERAÇÃO DE TSHS DOS ELETRODOS (DEPOIS DA OTIMIZAÇÃO BASEADO NO PRIMEIRO K-POINT)

### Pasta: 4_Transporte-Eletronico

[1] - bias_script.sh - EMULAÇÃO DE TRANSMITANCIA

[2] - tbtrans_script.sh - EMULAÇÃO DAS CORRENTES ELETRÔNICAS

[3] - get_IV_script.sh - ORDENAR AS CORRENTES ELETRÔNICAS EM UM UNICO ARQUIVO "IV.dat"

[4] - get_TE_script.sh - ORDENAR AS TRANSMITÂNCIAS EM UM UNICO ARQUIVO "Transmittance.dat"

[5] - RemoveScatTBT.sh - CASO OCORRA UM ERRO NO ARQUIVO "tbtrans_script.sh", use este script para remover todos os arquivos "scat.TBT.nc".

## MODELOS DE SCRIPTS INELASTICA:

[1] - EigenChannels_script.sh - EMULAÇÃO DE TRANSMITÂNCIAS NO MODELO DE AUTOCANAIS.


## Observações:
OBS: SEMPRE VERIFICAR A "VARIAÇÃO DAS TENSÕES" E OS O NOMES DOS ARQUIVOS DE "ENTRADA E SAIDA DO SISTEMA".




####################################################################################################################################################################################################################


### Deixar comentários e Likes para iniciar operação de upgrade dos instaladores.

### []´s
