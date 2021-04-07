if (-Not $TARGET_HOME) {
    $TARGET_HOME = "$HOME"
}

$SYMLINK = "$TARGET_HOME\Documents\config.xlaunch"
$TARGET = "$PSScriptRoot\..\..\xming\config.xlaunch"
New-Item -ItemType SymbolicLink -Force -Path "$SYMLINK" -Target "$TARGET"
