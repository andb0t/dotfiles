if (-Not $TARGET_HOME) {
  $TARGET_HOME = "$HOME"
}

$SYMLINK_DIR = "$TARGET_HOME\.jupyter"
$TARGET_DIR = "$PSScriptRoot\..\..\jupyter"
# delete entire directory in case it's not yet a symlink
function Is-Symlink([string]$path) {
  $file = Get-Item $path -Force -ea SilentlyContinue
  return [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)
}
if (Test-Path "$SYMLINK_DIR") {
  if (-Not (Is-Symlink($SYMLINK_DIR))) {
    Remove-Item -Recurse -Force "$SYMLINK_DIR"
  }
}
# now create the symlink
New-Item -ItemType SymbolicLink -d -Force -Path "$SYMLINK_DIR" -Target "$TARGET_DIR" -confirm:$false
