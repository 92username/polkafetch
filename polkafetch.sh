#!/bin/bash

# Função para obter informações da memória
get_mem_info() {
    MEM_USED=$(free -h | grep Mem | awk '{print $3}')
    MEM_TOTAL=$(free -h | grep Mem | awk '{print $2}')
    echo "$MEM_USED / $MEM_TOTAL"
}

# Função para obter informações da CPU
get_cpu_info() {
    CPU=$(lscpu | grep "Model name:" | sed 's/Model name: *//')
    echo "$CPU"
}

# Função para obter informações da GPU
get_gpu_info() {
    if command -v nvidia-smi &> /dev/null; then
        GPU=$(nvidia-smi --query-gpu=name --format=csv,noheader)
        echo "NVIDIA $GPU"
    elif lspci | grep -i vga | grep -iq "AMD"; then
        GPU=$(lspci | grep -i vga | grep -i amd | awk -F: '{print $3}')
        echo "AMD $GPU"
    else
        GPU=$(lspci | grep -i vga | awk -F: '{print $3}')
        echo "$GPU"
    fi
}

# Função para obter informações da Polkadot (preço e variações)
get_polkadot_info() {
    DATA=$(curl -s "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=polkadot" | jq '.[0]')

    PRICE=$(echo "$DATA" | jq '.current_price')
    CHANGE_1H=$(echo "$DATA" | jq '.price_change_percentage_1h_in_currency')
    CHANGE_24H=$(echo "$DATA" | jq '.price_change_percentage_24h')
    CHANGE_7D=$(echo "$DATA" | jq '.price_change_percentage_7d')
    CHANGE_30D=$(echo "$DATA" | jq '.price_change_percentage_30d')
    CHANGE_1Y=$(echo "$DATA" | jq '.price_change_percentage_1y')

    # Verificar e substituir null por "N/D"
    [ "$CHANGE_1H" == "null" ] && CHANGE_1H="N/D"
    [ "$CHANGE_24H" == "null" ] && CHANGE_24H="N/D"
    [ "$CHANGE_7D" == "null" ] && CHANGE_7D="N/D"
    [ "$CHANGE_30D" == "null" ] && CHANGE_30D="N/D"
    [ "$CHANGE_1Y" == "null" ] && CHANGE_1Y="N/D"

    echo "Polkadot (DOT)"
    echo "Preço Atual: \$ $PRICE"
    echo "Variação 1 hora: $CHANGE_1H%"
    echo "Variação 24 horas: $CHANGE_24H%"
    echo "Variação 7 dias: $CHANGE_7D%"
    echo "Variação 30 dias: $CHANGE_30D%"
    echo "Variação 1 ano: $CHANGE_1Y%"
}

# Arte ASCII ajustada
# Arte ASCII ajustada
ascii_art="
            .^!7JY55PPPP55YJ7!^.            
         :!J5PPPPPPPPPPPPPPPPPP5J!:         
      .!JPPPPPPPPPPPP55PPPPPPPPPPPPJ~.      
    .!5PPPPPPPPPPJ!^::::^!JPPPPPPPPPP5!                 
   ^YPPPPPPPPPPP7          7PPPPPPPPPPPY^               User@Hostname: $(whoami)@$(hostname)
  ~PPPPPPPJ~::!55!:.    .:!55!::~?PPPPPPP~              Distro:        $(lsb_release -ds)   
 ~PPPPPPJ:     JPPP5YYYY5PPPJ     :YPPPPPP~             Kernel:        $(uname -r)          
:5PPPPPY.     :5PPPPPPPPPPPP5:     .YPPPPP5:            Uptime:        $(uptime -p)         
?PPPPPP!     :YPPPPPPPPPPPPPPY:     !PPPPPP?            CPU:           $(get_cpu_info)      
5PPPPPPJ:..^?PPPPPPPPPPPPPPPPPP?^:.:JPPPPPP5            GPU:           $(get_gpu_info)      
PPPPPPPPPY5PPPPPPPPPPPPPPPPPPPPPP5YPPPPPPPPP            Memória:       $(get_mem_info)      
5PPPPPPJ:.:^?5PPPPPPPPPPPPPPPPP?^..:JPPPPPP5            Shell:         $SHELL               
?PPPPPP!     :YPPPPPPPPPPPPPPY:     !PPPPPP?                           
:5PPPPPY.     :5PPPPPPPPPPPP5:     .YPPPPP5:
 ~PPPPPPY:     JPPP5YJJY5PPPJ     :YPPPPPP~ 
  ~PPPPPPP?~::!55!:.    .:!55!::~JPPPPPP5~  
   ^YPPPPPPPPPPP7          7PPPPPPPPPPPY:   
     !5PPPPPPPPPPJ!^::::^!JPPPPPPPPPPY!     
      .~JPPPPPPPPPPPPP5PPPPPPPPPPPPJ~.      
         :!J5PPPPPPPPPPPPPPPPPP5J!:         
            .^~7JY55PPPP55YJ7~^.                                        
"

printf "$ascii_art"

# Exibir as informações da Polkadot
get_polkadot_info

# Finalizar o script
exit 0

