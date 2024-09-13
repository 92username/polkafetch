# README.md



# Polkafetch

O **Polkafetch** é um script personalizado baseado no Neofetch que exibe informações do sistema e dados da criptomoeda **Polkadot (DOT)**, incluindo o preço atual e suas variações.

## Pré-requisitos

Antes de utilizar o script, certifique-se de que você tenha o seguinte instalado no seu sistema:

- **Bash** (normalmente já vem instalado em sistemas Linux)
- **Curl** (para realizar requisições HTTP)
- **JQ** (para manipular JSON retornado pela API da CoinGecko)

Para instalar o `curl` e o `jq`, use os seguintes comandos:

```bash
sudo apt update
sudo apt install curl jq
```

## Como utilizar o Polkafetch

Siga os passos abaixo para baixar, configurar e executar o Polkafetch:

### 1. Clonar o repositório

Primeiro, clone este repositório para o seu diretório local usando o Git:

```bash
git clone https://github.com/92username/polkafetch.git
```

### 2. Navegar para o diretório do Polkafetch

Acesse o diretório onde o script **polkafetch.sh** foi baixado:

```bash
cd polkafetch
```

### 3. Tornar o script executável

Para que o script **polkafetch.sh** possa ser executado, você precisa garantir que ele tenha permissões de execução. Para isso, utilize o seguinte comando:

```bash
chmod +x polkafetch.sh
```

### 4. Executar o script

Agora que o script é executável, você pode rodá-lo com o seguinte comando:

```bash
./polkafetch.sh
```

Para poder executar o polkafetch apenas digitando polkafetch no terminal, é necessário adicionar o script ao /usr/local/bin ou um diretório similar que esteja no seu PATH. 

```bash
sudo cp polkafetch.sh /usr/local/bin/polkafetch
```
Agora o script poderá ser executado digitando apenas:
```bash
polkafetch
```
### 5. Resultado

Ao executar o **polkafetch**, você verá informações detalhadas sobre o seu sistema, incluindo o usuário, distribuição Linux, uptime, CPU, GPU, memória, além de informações sobre a Polkadot (DOT), como o preço atual e suas variações em 1 hora, 24 horas, 7 dias, 30 dias e 1 ano.

---

## Contribuição

Se você deseja contribuir com melhorias, sinta-se à vontade para abrir um Pull Request ou sugerir alterações através de Issues.
Melhorias sugeridas:  
-  Arte ASCII em cores
-  Alinhar info da Polkadot à direita, abaixo das info do sistema
-  Info relevante disponível em https://polkadot.subscan.io/


=======

(Adiciona instruções para tornar polkafetch executável globalmente)
