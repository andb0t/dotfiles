#!/bin/bash

TIMESTAMP=$(date +"%Y-%m-%dT%H-%M-%S")
ZIP_FILE="$DESKTOP/my_secrets_$TIMESTAMP.zip"

echo "Back up secret files and directories!"

declare -a arr=("$HOME/.gnupg/" 
                "$HOME/.kube/" 
                "$HOME/.ssh/"
                "$HOME/.password-store/"
                )

echo "Please enter the password to encrypt the file:"
read -s PASSWORD
echo "Please confirm the password:"
read -s PASSWORD_CONFIRM

if [ "$PASSWORD" != "$PASSWORD_CONFIRM" ]; then
  echo "ERROR: passwords don't match" && exit 1
fi

## now loop through the above array
for i in "${arr[@]}"
do
  echo "Adding $i ..."
  DIRNAME=$(dirname "$i")
  TARGET=$(basename "$i")
  cd "$DIRNAME" || exit 1
  zip --encrypt --password "$PASSWORD" -r "$ZIP_FILE" "$TARGET"
done

echo "Zipped all to $ZIP_FILE . Done!"

