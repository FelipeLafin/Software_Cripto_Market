import os
import shutil
import win32com.client

diretorio_usuario = os.path.expanduser('~')


def create_shortcut(bat_file, shortcut_name, icon_file):
    # Caminho para a área de trabalho
    desktop = os.path.join(os.path.join(os.environ['USERPROFILE']), 'Desktop')
    # Caminho completo do atalho
    shortcut_path = os.path.join(desktop, f"{shortcut_name}.lnk")

    # Criar o atalho
    shell = win32com.client.Dispatch("WScript.Shell")
    shortcut = shell.CreateShortCut(shortcut_path)
    shortcut.Targetpath = bat_file
    shortcut.IconLocation = icon_file
    shortcut.save()


# Caminho do arquivo .bat
bat_file = diretorio_usuario + r"\Downloads\Software_Preco_Criptos\start.bat"

# Caminho do ícone (.ico)
icon_file = diretorio_usuario + r"\Downloads\Software_Preco_Criptos\logo2.ico"

# Nome do atalho
shortcut_name = "Avaliador de Preço Criptos"

# Criar o atalho na área de trabalho com o ícone especificado
create_shortcut(bat_file, shortcut_name, icon_file)