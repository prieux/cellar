#!/bin/bash
# to decrypt the whole file:
#  openssl aes-256-cbc -salt -d -in private.enc -out private
#
# to encrypt the whole file:
#  openssl aes-256-cbc -salt -in private -out private.enc

read -sp "Password: " OPENSSLPASS
echo ""
read -sp "Service: " SERVICE
SERVICE="$(echo "$SERVICE"|tr -d '\n')"
OPENSSLPASS=$OPENSSLPASS openssl aes-256-cbc -salt -d -in private.enc -pass env:OPENSSLPASS | \
    awk '/'"$SERVICE"'/ {do_print=1} do_print==1 {print} NF==0 {do_print=0}' | \
    less
unset SERVICE
unset OPENSSLPASS
