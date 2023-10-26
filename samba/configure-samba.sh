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

#TODO: Create a function create users

# Create a function to create users, witch accepts a password as argument
create_users() {
    echo -e "$1\n$1" | smbpasswd -s -a "$2"
}

# Invoke the function to create users
create_users "admin" "admin"
create_users "user1" "user1"
create_users "user2" "user2"

# Iniciar o serviço Samba
exec smbd --foreground --no-process-group
