if (-Not $TARGET_HOME) {
  $TARGET_HOME = "$HOME"
}

$SYMLINK_DIR = "$TARGET_HOME\.ipython"
mkdir "$SYMLINK_DIR" 2>$1 | Out-Null

$files = @(
    "ipython_config.py"
  )

$TARGET_DIR = "$PSScriptRoot\..\..\ipython"

Write-Output "Link files ..."
foreach ($file in $files) {
    New-Item -ItemType SymbolicLink -Force -Path "$SYMLINK_DIR\$file" -Target "$TARGET_DIR\$file"
}
