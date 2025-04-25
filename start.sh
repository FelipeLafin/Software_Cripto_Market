#!/bin/bash
echo "Iniciando Analisador de Valores de Criptomoedas"
echo "---------------------------------------------"

# Definir o diretório do script como diretório de trabalho
cd "$(dirname "$0")"

# Tentar encontrar o comando Python
if command -v python3 &> /dev/null; then
    echo "Python encontrado com comando 'python3'"
    PYTHON_CMD="python3"
elif command -v python &> /dev/null; then
    echo "Python encontrado com comando 'python'"
    PYTHON_CMD="python"
elif command -v py &> /dev/null; then
    echo "Python encontrado com comando 'py'"
    PYTHON_CMD="py"
else
    # Tentar caminhos comuns de instalação
    PYTHON_PATHS=(
        "$HOME/.local/bin/python3.13"
        "$HOME/.local/bin/python3.12"
        "/usr/bin/python3.13"
        "/usr/bin/python3.12"
        "/usr/local/bin/python3.13"
        "/usr/local/bin/python3.12"
    )

    for path in "${PYTHON_PATHS[@]}"; do
        if [ -x "$path" ]; then
            echo "Python encontrado em: $path"
            PYTHON_CMD="$path"
            break
        fi
    done

    if [ -z "$PYTHON_CMD" ]; then
        echo "Python não encontrado! Por favor, instale o Python 3.13 ou superior."
        echo "Baixe em: https://www.python.org/downloads/"
        read -p "Pressione Enter para sair..."
        exit 1
    fi
fi

echo
echo "Tentando executar com: $PYTHON_CMD"
echo

# Instalar dependências
echo "Instalando dependências necessárias..."
$PYTHON_CMD -m pip install -r requirements.txt

# Executar o app principal
echo "Iniciando aplicativo diretamente..."
$PYTHON_CMD app.py

if [ $? -ne 0 ]; then
    echo
    echo "======================================="
    echo "Erro ao iniciar o aplicativo!"
    echo
    echo "Por favor, siga estas instruções:"
    echo "1. Baixe o Python 3.13 em: https://www.python.org/downloads/"
    echo "2. Instale corretamente o Python e verifique se está no PATH"
    echo "3. Execute este script novamente"
    echo "======================================="
    echo
fi

read -p "Pressione Enter para sair..."
