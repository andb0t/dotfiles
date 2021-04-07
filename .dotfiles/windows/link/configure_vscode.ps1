if (-Not $TARGET_HOME) {
  $TARGET_HOME = "$HOME"
}

$SYMLINK_DIR = "$TARGET_HOME\AppData\Roaming\Code\User"
mkdir "$SYMLINK_DIR" 2>$1 | Out-Null

$files = @(
    "keybindings.json"
    "settings.json"
  )

$TARGET_DIR = "$PSScriptRoot\..\..\vscode"

Write-Output "Link files ..."
foreach ($file in $files) {
    New-Item -ItemType SymbolicLink -Force -Path "$SYMLINK_DIR\$file" -Target "$TARGET_DIR\$file"
}
