#!/bin/bash

TITLE="Secure File Transfer (Zenity + SCP + AWS)"

FILE=$(zenity --file-selection --title="Select File to Transfer")

if [ -z "$FILE" ]; then
    zenity --error --text="No file selected!"
    exit 1
fi

IP=$(zenity --entry --title="$TITLE" --text="Enter EC2 Public IP")

if [ -z "$IP" ]; then
    zenity --error --text="IP Address required!"
    exit 1
fi

USER=$(zenity --entry --title="$TITLE" --text="Enter Username" --entry-text="ubuntu")

if [ -z "$USER" ]; then
    zenity --error --text="Username required!"
    exit 1
fi

KEY=$(zenity --file-selection --title="Select PEM Key File")

if [ -z "$KEY" ]; then
    zenity --error --text="PEM key required!"
    exit 1
fi

chmod 400 "$KEY"

DEST=$(zenity --entry --title="$TITLE" --text="Enter Destination Path" --entry-text="/home/ubuntu/")

if [ -z "$DEST" ]; then
    zenity --error --text="Destination required!"
    exit 1
fi

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

) | zenity --progress --title="$TITLE" --percentage=0 --auto-close

if [ $? -eq 0 ]; then
    zenity --info --text="File transferred successfully to EC2!"
else
    zenity --error --text="Transfer failed!"
fi