# 🚀 Secure File Transfer (Zenity + SCP + AWS EC2)

A GUI-based secure file transfer system to send files from a local VM to AWS EC2 using SCP over SSH.

---

## 📌 Features

- GUI-based file selection (Zenity)
- Secure transfer using SCP
- SSH key-based authentication
- Progress bar & alerts
- Error handling

---

## 🏗 Architecture

Local VM → SCP (SSH) → AWS EC2

---

## ⚙️ Technologies

- Linux (Ubuntu)
- AWS EC2
- Bash
- SCP / SSH
- Zenity

---

## 🛠 Installation

```bash
sudo apt update
sudo apt install zenity openssh-client -y
