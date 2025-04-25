@echo off
echo Iniciando Analisador de Valores de Criptomoedas
echo ---------------------------------------------
cd %~dp0

REM Verificar se o Python está disponível através de diferentes comandos
WHERE py >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    echo Python encontrado com comando 'py'
    set PYTHON_CMD=py
    goto :run_app
)

WHERE python >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    echo Python encontrado com comando 'python'
    set PYTHON_CMD=python
    goto :run_app
)

WHERE python3 >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    echo Python encontrado com comando 'python3'
    set PYTHON_CMD=python3
    goto :run_app
)

REM Verificar caminhos comuns de instalação do Python
set PYTHON_PATHS=^
C:\Python313\python.exe;^
C:\Python312\python.exe;^
C:\Python311\python.exe;^
C:\Python310\python.exe;^
C:\Python39\python.exe;^
C:\Python38\python.exe;^
C:\Python37\python.exe;^
C:\Python36\python.exe;^
C:\Program Files\Python313\python.exe;^
C:\Program Files\Python312\python.exe;^
C:\Program Files\Python311\python.exe;^
C:\Program Files\Python310\python.exe;^
C:\Program Files\Python39\python.exe;^
C:\Program Files\Python38\python.exe;^
C:\Program Files\Python37\python.exe;^
C:\Program Files\Python36\python.exe;^
C:\Program Files (x86)\Python313\python.exe;^
C:\Program Files (x86)\Python312\python.exe;^
C:\Program Files (x86)\Python311\python.exe;^
C:\Program Files (x86)\Python310\python.exe;^
C:\Program Files (x86)\Python39\python.exe;^
C:\Program Files (x86)\Python38\python.exe;^
C:\Program Files (x86)\Python37\python.exe;^
C:\Program Files (x86)\Python36\python.exe;^
C:\Users\Default\Downloads\Python\Python313\python.exe;
C:\Users\Default\Downloads\Python\Python312\python.exe;
C:\Users\Default\Downloads\Python\Python311\python.exe;
C:\Users\Default\Downloads\Python\Python310\python.exe;
C:\Users\Default\Downloads\Python\Python39\python.exe;
C:\Users\Default\Downloads\Python\Python38\python.exe;
C:\Users\Default\Downloads\Python\Python37\python.exe;
C:\Users\Default\Downloads\Python\Python36\python.exe;
C:\Users\Público\Downloads\Python\Python313\python.exe;
C:\Users\Público\Downloads\Python\Python312\python.exe;
C:\Users\Público\Downloads\Python\Python311\python.exe;
C:\Users\Público\Downloads\Python\Python310\python.exe;
C:\Users\Público\Downloads\Python\Python39\python.exe;
C:\Users\Público\Downloads\Python\Python38\python.exe;
C:\Users\Público\Downloads\Python\Python37\python.exe;
C:\Users\Público\Downloads\Python\Python36\python.exe;
%LOCALAPPDATA%\Programs\Python\Python313\python.exe;^
%LOCALAPPDATA%\Programs\Python\Python312\python.exe;^
%LOCALAPPDATA%\Programs\Python\Python311\python.exe;^
%LOCALAPPDATA%\Programs\Python\Python310\python.exe;^
%LOCALAPPDATA%\Programs\Python\Python39\python.exe;^
%LOCALAPPDATA%\Programs\Python\Python38\python.exe;^
%LOCALAPPDATA%\Programs\Python\Python37\python.exe;^
%LOCALAPPDATA%\Programs\Python\Python36\python.exe;
%LOCALAPPDATA%\Downloads\Python\Python313\python.exe;^
%LOCALAPPDATA%\Downloads\Python\Python312\python.exe;^
%LOCALAPPDATA%\Downloads\Python\Python311\python.exe;^
%LOCALAPPDATA%\Downloads\Python\Python310\python.exe;^
%LOCALAPPDATA%\Downloads\Python\Python39\python.exe;^
%LOCALAPPDATA%\Downloads\Python\Python38\python.exe;^
%LOCALAPPDATA%\Downloads\Python\Python37\python.exe;^
%LOCALAPPDATA%\Downloads\Python\Python36\python.exe;


FOR %%p IN (%PYTHON_PATHS%) DO (
    IF EXIST %%p (
        echo Python encontrado em: %%p
        set PYTHON_CMD="%%p"
        goto :run_app
    )
)

echo Python não encontrado! Tentando usar o Python do Windows Store...
set PYTHON_CMD=python

:run_app
echo.
echo Tentando executar com: %PYTHON_CMD%
echo.

REM Instalar dependências
echo Instalando dependências necessárias...
%PYTHON_CMD% -m pip install -r requirements.txt

REM Executar aplicativo diretamente (sem o run.py)
echo Iniciando aplicativo diretamente...
%PYTHON_CMD% app.py

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo =======================================
    echo Erro ao iniciar o aplicativo!
    echo.
    echo Por favor, siga estas instruções:
    echo 1. Baixe o Python 3.13 em: https://www.python.org/downloads/
    echo 2. IMPORTANTE: Durante a instalação, marque a opção:
    echo    [X] Add Python to PATH
    echo 3. Execute este script novamente
    echo =======================================
    echo.
)

pause