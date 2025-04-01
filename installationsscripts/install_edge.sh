#!/bin/bash

# Überprüfen, ob curl installiert ist, und ggf. installieren
if ! command -v curl &> /dev/null
then
    echo "curl wird installiert..."
    sudo apt update
    sudo apt install -y curl
fi

# Microsoft GPG-Schlüssel hinzufügen und Repository einrichten
echo "Microsoft GPG-Schlüssel und Repository hinzufügen..."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg
# Paketlisten aktualisieren und Microsoft Edge installieren
echo "Paketlisten aktualisieren und Microsoft Edge installieren..."
sudo apt update
sudo apt install -y microsoft-edge-stable
echo "Installation abgeschlossen. Sie können Microsoft Edge jetzt starten, indem Sie 'microsoft-edge' in das Terminal eingeben."
