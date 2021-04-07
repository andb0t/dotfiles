if (-Not $TARGET_HOME) {
  $TARGET_HOME = "$HOME"
}

$SYMLINK_DIR = "$TARGET_HOME\Pictures"
mkdir "$SYMLINK_DIR" 2>$1 | Out-Null

$files = @(
    "powershell.ico"
    "bash.ico"
    "error.jpg"
    "ok.jpg"
  )

$TARGET_DIR = "$PSScriptRoot\..\..\img"

Write-Output "Link files ..."
foreach ($file in $files) {
    New-Item -ItemType SymbolicLink -Force -Path "$SYMLINK_DIR\$file" -Target "$TARGET_DIR\$file"
}
