$JOYTOKEY_DIR = "$HOME\Documents\JoyToKey"
echo "Export configs from $PSScriptRoot to $JOYTOKEY_DIR ..."
cp -Confirm $PSScriptRoot\*.cfg $JOYTOKEY_DIR
