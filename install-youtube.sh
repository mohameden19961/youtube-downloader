#!/bin/bash

echo "======================================"
echo "   Installation YouTube Downloader"
echo "======================================"
echo ""

# Étape 1 - Installer pipx si pas installé
echo "📦 Étape 1 : Installation de pipx..."
sudo apt install pipx -y
echo "✅ pipx installé"
echo ""

# Étape 2 - Installer yt-dlp
echo "📦 Étape 2 : Installation de yt-dlp..."
pipx install yt-dlp
echo "✅ yt-dlp installé"
echo ""

# Étape 3 - Installer secretstorage
echo "📦 Étape 3 : Installation de secretstorage..."
pip install secretstorage --break-system-packages
echo "✅ secretstorage installé"
echo ""

# Étape 4 - Créer l'alias dans le bon fichier
echo "⚙️  Étape 4 : Création de l'alias 'youtube'..."

SHELL_NAME=$(basename "$SHELL")

if [ "$SHELL_NAME" = "zsh" ]; then
    CONFIG_FILE="$HOME/.zshrc"
elif [ "$SHELL_NAME" = "bash" ]; then
    CONFIG_FILE="$HOME/.bashrc"
else
    CONFIG_FILE="$HOME/.bashrc"
fi

# Vérifier si l'alias existe déjà
if grep -q 'alias youtube=' "$CONFIG_FILE"; then
    echo "⚠️  L'alias existe déjà dans $CONFIG_FILE"
else
    echo 'alias youtube="yt-dlp --extractor-args \"youtube:player_client=android\""' >> "$CONFIG_FILE"
    echo "✅ Alias ajouté dans $CONFIG_FILE"
fi

echo ""

# Étape 5 - Résumé
echo "======================================"
echo "   ✅ Installation terminée !"
echo "======================================"
echo ""
echo "👉 Pour télécharger une vidéo, tape :"
echo ""
echo '   youtube "https://youtu.be/XXXX"'
echo ""
echo "⚠️  Si la commande youtube ne marche pas,"
echo "   ferme et rouvre le terminal puis réessaie."
echo "======================================"
