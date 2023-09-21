#!/bin/bash

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

verificar_sudo() {
    if [ "$EUID" -ne 0 ]; then
        printf "Este script requer privilégios SUDO. Execute o script com 'sudo'.\n"
        exit 1
    fi
}

verificar_sudo

if [ -f "$DESTINO/$NOME_BACKUP" ]; then
    rm "$DESTINO/$NOME_BACKUP"
fi

mkdir -p "$DESTINO"

# Compactar as pastas
zip -r "$DESTINO/$NOME_BACKUP" "${PASTAS[@]}"

echo "Backup completo $DESTINO/$NOME_BACKUP"
