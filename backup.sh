#!/bin/bash
#===============================================================================
#          FILE: backup.sh
#
#         USAGE: ./backup.sh
#
#   DESCRIPTION: Script for backup of samba folders
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Diogo Pacheco @Swift132 (diogopacheco@gmail.com),
#  ORGANIZATION:
#       CREATED: 23/09/2023 13:48
#===============================================================================
# Diretório de destino para o backup
DESTINO=./backups

DATA=$(date +"%d_%m_%y")

NOME_BACKUP="Backup_${DATA}.zip"

# Lista de pastas a serem incluídas no backup
PASTAS=(
    ./priv
    ./pub
    ./usr1
    ./usr2
)

# Function to check if the script is running as root
mkdir -p "${PASTAS[@]}"

# Remover o backup anterior
if [ -f "$DESTINO/$NOME_BACKUP" ]; then
    rm "$DESTINO/$NOME_BACKUP"
fi

mkdir -p "$DESTINO"

# Compactar as pastas
zip -r "$DESTINO/$NOME_BACKUP" "${PASTAS[@]}"

echo "Backup completo $DESTINO/$NOME_BACKUP"
