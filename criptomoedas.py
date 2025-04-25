import websocket
import json
import threading
import tkinter as tk
from tkinter import ttk, messagebox
import webbrowser

para_alerta = False
precos = {"BTC": None, "ETH": None, "USDT": None}
valor_brl = 0

def abrir_link_BTC_venda():
    webbrowser.open("https://www.binance.com/pt-BR/crypto/sell/BRL/BTC")

def abrir_link_BTC_compra():
    webbrowser.open("https://www.binance.com/pt-BR/crypto/buy/BRL/BTC")

def on_message(ws, message, moeda):
    data = json.loads(message)
    print(f"Dados recebidos para {moeda}: {data}")
    if "a" in data and data["a"]:
        precos[moeda] = float(data["a"][0][0])

def start_websocket(url, moeda):
    def on_message_wrapper(ws, message):
        on_message(ws, message, moeda)
    ws = websocket.WebSocketApp(url, on_message=on_message_wrapper)
    ws.run_forever()

sockets = {
    "BTC": "wss://stream.binance.com:443/ws/btcbrl@depth",
    "ETH": "wss://stream.binance.com:443/ws/ethbrl@depth",
    "USDT": "wss://stream.binance.com:443/ws/usdtbrl@depth"
}

threads = []
for moeda, url in sockets.items():
    thread = threading.Thread(target=start_websocket, args=(url, moeda))
    thread.daemon = True
    threads.append(thread)
    thread.start()

def formatar(valor):
    if valor is None:
        return "Carregando..."
    valor_real = (f"R$ {valor:,.2f}".replace(',', 'X').replace('.', ',').replace('X', '.'))
    return valor_real

def calcular_quantidade():
    global valor_brl
    try:
        if valor_brl > 0:
            moeda = combo_moeda.get()
            if precos[moeda] is not None:
                quantidade = valor_brl / precos[moeda]
                label_resultado.config(text=f"Você pode comprar ou vender por:\n{quantidade:.6f} {moeda}")
            else:
                label_resultado.config(text="Preço indisponível\n")
        else:
            label_resultado.config(text="Insira um valor em BRL!\n")
    except ValueError:
        label_resultado.config(text="Valor inválido\n")

def atualizar_valor_brl(event=None):
    global valor_brl
    try:
        valor_brl = float(entry_valor_brl.get())
        calcular_quantidade()
    except ValueError:
        label_resultado.config(text="Valor inválido")

root = tk.Tk()
root.title("Cotação em Tempo Real")
root.geometry("350x420")
root.configure(bg="black")
root.attributes("-topmost", True)

label_btc = tk.Label(root, text="BTC: Carregando...", font=("Arial", 14), fg="white", bg="black")
label_btc.pack(pady=5)

label_eth = tk.Label(root, text="ETH: Carregando...", font=("Arial", 14), fg="white", bg="black")
label_eth.pack(pady=5)

label_usdt = tk.Label(root, text="USDT: Carregando...", font=("Arial", 14), fg="white", bg="black")
label_usdt.pack(pady=5)

label_valor_brl = tk.Label(root, text="Valor em BRL:", font=("Arial", 12), fg="white", bg="black")
label_valor_brl.pack(pady=5)

entry_valor_brl = tk.Entry(root, font=("Arial", 12))
entry_valor_brl.pack(pady=5)
entry_valor_brl.bind("<KeyRelease>", atualizar_valor_brl)

label_moeda = tk.Label(root, text="Escolha a moeda:", font=("Arial", 12), fg="white", bg="black")
label_moeda.pack(pady=5)

combo_moeda = ttk.Combobox(root, values=["BTC", "ETH", "USDT"], state="readonly", font=("Arial", 12))
combo_moeda.set("BTC")
combo_moeda.pack(pady=5)

label_resultado = tk.Label(root, text="Você pode comprar ou vender por:\n0.000000 BTC", font=("Arial", 14), fg="white", bg="black")
label_resultado.pack(pady=10)

btn_binance_sell = tk.Button(root, text="VENDER BITCOIN", command=abrir_link_BTC_venda, font=("Arial", 12), bg="Red", fg="white")
btn_binance_sell.pack(pady=10)

btn_binance_buy = tk.Button(root, text="COMPRAR BITCOIN", command=abrir_link_BTC_compra, font=("Arial", 12), bg="Green", fg="white")
btn_binance_buy.pack(pady=10)
def atualizar_interface():
    label_btc.config(text=f"BTC: {formatar(precos['BTC'])}")
    label_eth.config(text=f"ETH: {formatar(precos['ETH'])}")
    label_usdt.config(text=f"USDT: {formatar(precos['USDT'])}")
    calcular_quantidade()
    root.after(50, atualizar_interface)

atualizar_interface()
root.mainloop()

