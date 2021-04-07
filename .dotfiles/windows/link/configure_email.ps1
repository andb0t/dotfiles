if (-Not $TARGET_HOME) {
  $TARGET_HOME = "$HOME"
}

$SYMLINK_DIR = "$TARGET_HOME\Documents"
mkdir "$SYMLINK_DIR" 2>$1 | Out-Null

$files = @(
    "signature_CERN.txt"
    "signature_private.txt"
  )

$TARGET_DIR = "$PSScriptRoot\..\..\thunderbird"

Write-Output "Link files ..."
foreach ($file in $files) {
    New-Item -ItemType SymbolicLink -Force -Path "$SYMLINK_DIR\$file" -Target "$TARGET_DIR\$file"
}
