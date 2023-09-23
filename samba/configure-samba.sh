#!/bin/bash
#===============================================================================
#          FILE: configure-samba.sh
#
#         USAGE: ./samba.sh
#
#   DESCRIPTION: Entrypoint for samba docker container
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Diogo Pacheco @Swift132 (diogopacheco@gmail.com),
#  ORGANIZATION:
#       CREATED: 23/09/2023 13:42
#===============================================================================

# Crie os usuários com senhas
echo -e "admin\nadmin" | smbpasswd -s -a "admin"
echo -e "user1\nuser1" | smbpasswd -s -a "user1"
echo -e "user2\nuser2" | smbpasswd -s -a "user2"

# Inicialize o serviço Samba
exec smbd --foreground --no-process-group