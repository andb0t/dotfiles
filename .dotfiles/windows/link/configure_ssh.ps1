if (-Not $TARGET_HOME) {
    $TARGET_HOME = "$HOME"
}

mkdir "$TARGET_HOME\.ssh" 2>$1 | Out-Null
$SYMLINK = "$TARGET_HOME\.ssh\config"
$TARGET = "$PSScriptRoot\..\..\ssh\config"
New-Item -ItemType SymbolicLink -Force -Path "$SYMLINK" -Target "$TARGET"
