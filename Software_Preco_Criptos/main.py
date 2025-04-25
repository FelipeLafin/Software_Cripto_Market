#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Script de inicialização para o Extrator de Contratos DOCX para HTML.
Este script verifica as dependências necessárias antes de iniciar o aplicativo principal.
"""

import os
import sys
import subprocess
import importlib.util


def verificar_instalacao_python():
    versao = sys.version_info
    if versao.major < 3 or (versao.major == 3 and versao.minor < 6):
        print(f"Versão do Python incompatível: {sys.version}")
        print("Este aplicativo requer Python 3.13 ou superior.")
        input("Pressione Enter para sair...")
        sys.exit(1)

    print(f"Python {versao.major}.{versao.minor}.{versao.micro} detectado.")
    return True


def verificar_dependencias():
    dependencias = ['docx']
    instalar = []

    for dependencia in dependencias:
        if importlib.util.find_spec(dependencia) is None:
            instalar.append(dependencia)

    if not instalar:
        print("Todas as dependências já estão instaladas.")
        return True

    print(f"Instalando dependências faltantes: {', '.join(instalar)}")

    try:
        if 'docx' in instalar:
            instalar.remove('docx')
            instalar.append('requirements.txt')

        if instalar:
            subprocess.check_call([sys.executable, '-m', 'pip', 'install', '-r'] + instalar)

        print("Dependências instaladas com sucesso!")
        return True
    except Exception as erro:
        print(f"Erro ao instalar dependências: {str(erro)}")
        print("\nTente instalar manualmente com:")
        print("pip install -r requirements.txt")
        input("\nPressione Enter para continuar mesmo assim...")
        return False

def iniciar_aplicativo():
    try:
        print("Iniciando aplicativo principal...")

        caminho_app = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'app.py')

        if not os.path.exists(caminho_app):
            print(f"Erro: Arquivo do aplicativo não encontrado: {caminho_app}")
            input("Pressione Enter para sair...")
            return False

        especificacao = importlib.util.spec_from_file_location("app", caminho_app)
        aplicativo = importlib.util.module_from_spec(especificacao)
        especificacao.loader.exec_module(aplicativo)

        return True
    except Exception as erro:
        print(f"Erro ao iniciar o aplicativo: {str(erro)}")
        input("Pressione Enter para sair...")
        return False

if __name__ == "__main__":
    print("Analisador de Valores de Criptomoedas - Verificação de Inicialização")
    print("=" * 70)

    if not verificar_instalacao_python():
        sys.exit(1)

    verificar_dependencias()
    iniciar_aplicativo()