#!/bin/bash
# to decrypt the whole file:
#  openssl aes-256-cbc -salt -d -in private.enc -out private
#
# to encrypt the whole file:
#  openssl aes-256-cbc -salt -in private -out private.enc

PASSFILE=$1
if [ "$PASSFILE" == "" ] || [ ! -f $PASSFILE ]
then
    echo "No passfile provided, exiting..."
    exit 1
fi
read -sp "Password: " OPENSSLPASS
export SERVICE=""
echo ""
read -srp "service:" SERVICE
while [ "$SERVICE" != "" ]
do
    SERVICE="$(echo "$SERVICE"|/usr/bin/tr -d '\n')"
    OPENSSLPASS=$OPENSSLPASS openssl aes-256-cbc -salt -d -in $PASSFILE -pass env:OPENSSLPASS | \
        /usr/bin/awk '/'"$SERVICE"'/ {do_print=1} do_print==1 {print} NF==0 {do_print=0}' | \
        /usr/bin/less
    echo ""
    read -srp "service:" SERVICE
done
unset SERVICE
unset OPENSSLPASS
