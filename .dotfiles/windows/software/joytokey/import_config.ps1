$JOYTOKEY_DIR = "$HOME\Documents\JoyToKey"
echo "Import configs from $JOYTOKEY_DIR to $PSScriptRoot ..."
cp $JOYTOKEY_DIR\*.cfg $PSScriptRoot
