# allow execution of any script
Set-ExecutionPolicy RemoteSigned

$SYMLINK_DIR = "$PSHOME"
$TARGET_DIR = "$PSScriptRoot/../software/powershell"

Write-Output "Link files ..."
foreach($file in Get-ChildItem "$TARGET_DIR/*") {
  # Write-Output $file
  $BASENAME = Split-Path -Path "$file" -Leaf
  New-Item -ItemType SymbolicLink -Force -Path "$SYMLINK_DIR\$BASENAME" -Target "$file"
}
