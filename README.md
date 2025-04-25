# Analisador de Valores de Criptomoedas

Este aplicativo permite acompanhar o preço das criptomoedas mais importantes, simular o valor que seria recebido/pago baseado no valor em tempo real da criptomoeda selecionada e redirecionar o usuário para a aba de compra/venda no site oficial.
---

## DOWNLOAD FILE

[Software - win32x](Software_cripto.zip)
---

## 🚀 Instalação Rápida (Windows)

Para facilitar a instalação no Windows, utilize o arquivo `instalador.bat`:

1. Clique duas vezes no arquivo `instalador.bat`  
2. O instalador verificará se o Python está instalado no seu sistema  
3. Caso não encontre, oferecerá abrir a página para download do Python  
4. Após a instalação do Python, o instalador configurará as dependências necessárias  
5. Ao término, o aplicativo estará pronto para uso  

---

## 🔧 Instalação Manual

### 📋 Pré-requisitos

- Python 3.13 ou superior  
  - [Download Python](https://www.python.org/downloads/)  
  - ⚠️ Certifique-se de marcar a opção **"Add Python to PATH"** durante a instalação

### 🖥️ Executando o Aplicativo

#### No Windows:
- Na sua área de trabalho, clique duas vezes no arquivo `Avaliador de Preço Criptos`  
- Ou execute no terminal:
  ```bash
  python main.py
  ```

#### No Linux/Mac:
- Execute o comando no terminal:
  ```bash
  ./start.sh
  ```
- Ou execute:
  ```bash
  python main.py
  ```

---

### 🔄 Script de Inicialização Universal

O arquivo `main.py` é um script universal de inicialização que:

1. Verifica a versão do Python instalada  
2. Instala as dependências necessárias se não estiverem presentes  
3. Inicia o aplicativo principal  

---

## 📈 Uso

1. Ao abrir o aplicativo, você verá os preços em tempo real das criptomoedas  
2. Você pode simular um valor que deseja comprar/vender sua cripto e o programa calculará o valor a receber/pagar em tempo real  
3. Você pode selecionar a moeda que deseja acompanhar  
4. Clique em **"Comprar"** para ser redirecionado ao menu de compra da cripto escolhida  
5. Ou clique em **"Vender"** para ser redirecionado ao menu de venda da cripto escolhida  
6. O programa está em constante atualização :)  

---

## 📂 Arquivos do Projeto

| Arquivo | Descrição |
|--------|------------|
| `app.py` | Aplicativo principal com interface gráfica |
| `design_programa.py` | Criador do atalho do programa |
| `requirements.txt` | Lista de dependências |
| `README.md` | Este arquivo de documentação |
| `main.py` | Script universal de inicialização |
| `start.bat` | Script de inicialização para Windows |
| `start.sh` | Script de inicialização para Linux/Mac |
| `criptomoedas.py` | Código completo do programa |
| `ícone.ico` | Ícone do aplicativo |

---

## 🛠️ Solução de Problemas

### ❌ Erro "Python was not found"

Esse erro ocorre quando o Python não está configurado corretamente no PATH do sistema:

- Reinstale o Python marcando a opção **"Add Python to PATH"** durante a instalação  
- Ou use o arquivo `instalador.bat` que tentará localizar o Python no sistema  

### 🔐 Permissões de Arquivo no Linux/Mac

Se encontrar erros de permissão ao executar `start.sh`:

1. Abra o terminal e navegue até a pasta do projeto  
2. Execute o comando:
   ```bash
   chmod +x start.sh
   ```
3. Tente novamente com:
   ```bash
   ./start.sh
   ```

---

## 👨‍💻 Desenvolvimento

Para desenvolvedores, o código foi organizado de forma a facilitar melhorias futuras:

- As funções de extração e processamento estão em `app.py`  
- A interface gráfica foi criada com Tkinter para máxima compatibilidade
