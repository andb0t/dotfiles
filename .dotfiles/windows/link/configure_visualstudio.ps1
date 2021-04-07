if (-Not $TARGET_HOME) {
  $TARGET_HOME = "$HOME"
}

# find the right directory
$SEARCH_DIR = "$TARGET_HOME\AppData\Local\microsoft\visualstudio"
if (-Not (Test-Path "$SEARCH_DIR")) {
  Write-Output "Directory $SEARCH_DIR not found, skip."
  return
}
$REGEX = "16*"
$FOUND_DIR = (Get-ChildItem "$SEARCH_DIR\$REGEX").Name
if (!$FOUND_DIR) {
  Write-Output "$SEARCH_DIR\$REGEX : folder not found, skip."
  return
}
# now use it
$SYMLINK_DIR = "$SEARCH_DIR\$FOUND_DIR"
$TARGET_DIR = "$PSScriptRoot\..\..\visualstudio"
# update keymaps
$files = @(
    "my_keybindings.vssettings"
  )
foreach ($file in $files) {
    New-Item -ItemType SymbolicLink -Force -Path "$SYMLINK_DIR\settings\$file" -Target "$TARGET_DIR\$file"
}

Write-Output ""
Write-Output 'To load the changes into VS, go to "Tools" -> "Import and Export Settings Wizard"'
