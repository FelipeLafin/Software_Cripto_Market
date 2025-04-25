@echo off
title Instalador do Analisador de valores de criptomoedas
color 0A
cls

echo ===============================================================
echo        INSTALADOR - Analisador de Valores de Criptomoedas
echo ===============================================================
echo.
echo Este instalador vai ajudar a configurar o ambiente necessário
echo para executar o aplicativo do analisador de valores de criptos.
echo.
echo O que este instalador vai fazer:
echo  1. Verificar se o Python está instalado
echo  2. Se não estiver, ajudar você a baixar e instalar
echo  3. Instalar as dependências necessárias
echo.
echo ===============================================================
echo.
pause

cls
echo Verificando se o Python está instalado...
echo.

REM Verificar se o Python está disponível
WHERE python >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    goto :python_found
) ELSE (
    goto :python_not_found
)

:python_found
echo Python encontrado! Verificando a versão...
python --version
echo.
echo Deseja continuar com a instalação das dependências? (S/N)
choice /c SN /m "Escolha uma opção:"

IF ERRORLEVEL 2 goto :end
IF ERRORLEVEL 1 goto :install_deps

:python_not_found
echo Python não foi encontrado no seu sistema.
echo.
echo Para continuar, você precisa instalar o Python:
echo.
echo 1. Baixe o Python 3.13 ou mais recente em:
echo    https://www.python.org/downloads/
echo.
echo 2. IMPORTANTE: Durante a instalação, marque a opção:
echo    [X] Add Python to PATH
echo.
echo 3. Depois de instalar, execute este instalador novamente.
echo.
choice /c SN /m "Deseja abrir a página de download do Python agora? (S/N):"

IF ERRORLEVEL 2 goto :end
IF ERRORLEVEL 1 (
    start https://www.python.org/downloads/
    goto :end
)

:install_deps
cls
echo Instalando dependências necessárias...
echo.
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
echo.
echo Dependências instaladas com sucesso!
echo.
echo ===============================================================
echo Instalação concluída! Agora você pode executar o aplicativo.
echo.
echo Para iniciar o aplicativo, clique duas vezes no programa na sua área de trabalho!
echo ===============================================================
echo.
python3 design_programa.py
echo Obrigado por usar o instalador!
echo.
goto :end
:end
pause
exit