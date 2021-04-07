if (-Not $TARGET_HOME) {
  $TARGET_HOME = "$HOME"
}

$SYMLINK_DIR = "$TARGET_HOME\.atom"
mkdir "$SYMLINK_DIR" 2>$1 | Out-Null

$files = @(
    "config.cson"
    "init.coffee"
    "keymap.cson"
    "snippets.cson"
    "styles.less"
    "packages.cson"
  )

$TARGET_DIR = "$PSScriptRoot\..\..\atom"

Write-Output "Link files ..."
foreach ($file in $files) {
    New-Item -ItemType SymbolicLink -Force -Path "$SYMLINK_DIR\$file" -Target "$TARGET_DIR\$file"
}
