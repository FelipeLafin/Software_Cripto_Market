# Cryptocurrency Value Analyzer

This application allows you to track the prices of major cryptocurrencies, simulate the amount you would receive/pay based on the real-time value of the selected crypto, and redirect the user to the buy/sell page on the official website.

---

## DOWNLOAD


---

## 🚀 Quick Installation (Windows)

To simplify installation on Windows, use the `instalador.bat` file:

1. Double-click the `instalador.bat` file  
2. The installer will check if Python is installed on your system  
3. If not found, it will offer to open the download page for Python  
4. After installing Python, the installer will set up the required dependencies  
5. Once finished, the application will be ready to use  

---

## 🔧 Manual Installation

### 📋 Prerequisites

- Python 3.13 or higher  
  - [Download Python](https://www.python.org/downloads/)  
  - ⚠️ Make sure to check the **"Add Python to PATH"** option during installation

### 🖥️ Running the Application

#### On Windows:
- Double-click the `Crypto Price Evaluator` file on your desktop  
- Or run the command below in your terminal:
  ```bash
  python main.py
  ```

#### On Linux/Mac:
- Run the following command in the terminal:
  ```bash
  ./start.sh
  ```
- Or run:
  ```bash
  python main.py
  ```

---

### 🔄 Universal Startup Script

The `main.py` file is a universal startup script that:

1. Checks the installed Python version  
2. Installs required dependencies if they are missing  
3. Launches the main application  

---

## 📈 Usage

1. When you open the application, you’ll see real-time cryptocurrency prices  
2. You can simulate an amount to buy/sell, and the app will calculate how much you’ll pay/receive  
3. Select the currency you want to track  
4. Click **"Buy"** to be redirected to the crypto purchase page  
5. Or click **"Sell"** to be redirected to the selling page  
6. The application is constantly being updated :)  

---

## 📂 Project Files

| File | Description |
|------|-------------|
| `app.py` | Main application with GUI |
| `design_programa.py` | Program shortcut creator |
| `requirements.txt` | List of Python dependencies |
| `README.md` | This documentation file |
| `main.py` | Universal startup script |
| `start.bat` | Windows startup script |
| `start.sh` | Linux/Mac startup script |
| `criptomoedas.py` | Full program logic |
| `ícone.ico` | Program icon |

---

## 🛠️ Troubleshooting

### ❌ "Python was not found" Error

This error occurs when Python is not properly configured in your system’s PATH:

- Reinstall Python and check the **"Add Python to PATH"** option  
- Or use the `instalador.bat` file, which attempts to locate Python automatically  

### 🔐 File Permissions on Linux/Mac

If you encounter permission errors when running `start.sh`:

1. Open the terminal and navigate to the project folder  
2. Run:
   ```bash
   chmod +x start.sh
   ```
3. Then execute:
   ```bash
   ./start.sh
   ```

---

## 👨‍💻 Development

For developers, the codebase is organized for easy updates and improvements:

- Extraction and processing functions are in `app.py`  
- GUI is built using Tkinter for maximum compatibility