🚀 Major Project 7 (FINAL):
Secure File Transfer using Zenity & SCP (AWS EC2)
________________________________________

1. Introduction
In modern computing environments, secure file transfer is a critical requirement, especially when working with remote systems and cloud infrastructure. This project demonstrates a secure and automated file transfer system using Zenity (GUI) and SCP (Secure Copy Protocol).
________________________________________
2. Objective

•	To develop a GUI-based secure file transfer system 
•	To implement file transfer using SCP over SSH 
•	To automate remote file transfer using shell scripting 
•	To understand cloud-based communication using AWS EC2


🔧 3. Prerequisites
On Local VM:
Command: sudo apt update
sudo apt install zenity openssh-client -y
 
________________________________________
 
💻 4. Final Script (Production Version)
Create file:
Command : nano zenity_scp_final.sh
 

Paste this 👇
#!/bin/bash

TITLE="Secure File Transfer (Zenity + SCP + AWS)"

# Step 1: Select File
FILE=$(zenity --file-selection --title="Select File to Transfer")

if [ -z "$FILE" ]; then
    zenity --error --text="No file selected!"
    exit 1
fi

# Step 2: Enter EC2 Public IP
IP=$(zenity --entry --title="$TITLE" --text="Enter EC2 Public IP")

if [ -z "$IP" ]; then
    zenity --error --text="IP Address required!"
    exit 1
fi

# Step 3: Enter Username (default: ubuntu)
USER=$(zenity --entry --title="$TITLE" --text="Enter Username (e.g. ubuntu)" --entry-text="ubuntu")

if [ -z "$USER" ]; then
    zenity --error --text="Username required!"
    exit 1
fi

# Step 4: Select PEM Key
KEY=$(zenity --file-selection --title="Select PEM Key File")

if [ -z "$KEY" ]; then
    zenity --error --text="PEM key required!"
    exit 1
fi

# Fix permission automatically
chmod 400 "$KEY"
# Step 5: Destination Path
DEST=$(zenity --entry --title="$TITLE" --text="Enter Destination Path" --entry-text="/home/ubuntu/")

if [ -z "$DEST" ]; then
    zenity --error --text="Destination required!"
    exit 1
fi

# Step 6: Transfer with Progress
(
echo "10"; echo "# Connecting to EC2..."
sleep 1

echo "40"; echo "# Uploading file..."

scp -i "$KEY" -o StrictHostKeyChecking=no "$FILE" "$USER@$IP:$DEST"

if [ $? -eq 0 ]; then
    echo "100"; echo "# Transfer Completed!"
else
    echo "100"; echo "# Transfer Failed!"
    exit 1
fi

) | zenity --progress \
--title="$TITLE" \
--percentage=0 \
--auto-close

# Final Status
if [ $? -eq 0 ]; then
    zenity --info --text="✅ File transferred successfully to EC2!"
else
    zenity --error --text="❌ Transfer failed!"
fi
 

🔐 5. Make Executable
Command : chmod +x zenity_scp_final.sh

 
________________________________________
▶️ 6. Run Project
Command : ./zenity_scp_final.sh
 
________________________________________
 7. Workflow (Write in Report)
1.	User selects file using Zenity GUI 
 
 
2.	User enters EC2 Public IP 
 

3.	User enters username (ubuntu) 
 

4.	User selects PEM key file 
 

5.	Success/error message displayed 
 
________________________________________
Aws console : 

Architecture for project
 
