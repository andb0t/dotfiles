if (-Not $TARGET_HOME) {
  $TARGET_HOME = "$HOME"
}

# find the right directory
$SEARCH_DIR = "$TARGET_HOME\AppData\Roaming\JetBrains"
if (-Not (Test-Path "$SEARCH_DIR")) {
  Write-Output "Directory $SEARCH_DIR not found, skip."
  return
}
$REGEX = "IdeaIC*"
$FOUND_DIR = (Get-ChildItem "$SEARCH_DIR\$REGEX").Name
if (!$FOUND_DIR) {
  Write-Output "$SEARCH_DIR\$REGEX : folder not found, skip."
  return
}
# now use it
$SYMLINK_DIR = "$SEARCH_DIR\$FOUND_DIR"
$TARGET_DIR = "$PSScriptRoot\..\..\intellij"
# update keymaps
$files = @(
    "my_keymap.xml"
  )
foreach ($file in $files) {
    New-Item -ItemType SymbolicLink -Force -Path "$SYMLINK_DIR\keymaps\$file" -Target "$TARGET_DIR\$file"
}
