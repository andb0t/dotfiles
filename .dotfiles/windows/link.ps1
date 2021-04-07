Import-Module -DisableNameChecking $PSScriptRoot\lib\Elevate.psm1 -Force
Import-Module -DisableNameChecking $PSScriptRoot\lib\Script-Failed.psm1  -Force

if (-Not $TARGET_USER) {
  $TARGET_USER = read-host "Please enter the username to configure (default: $env:UserName)"
}
if (-Not $TARGET_USER) {
  $TARGET_USER = $env:UserName
}
$TARGET_HOME = "C:\Users\$TARGET_USER"

Write-Information "Create symlinks for software settings ..."

# force admin rights
if (!(Elevate $PSCommandPath) ){
  ScriptFailed "Elevate failed"
}

# run configure scripts
Get-ChildItem "$PSScriptRoot\link\*" | ForEach-Object {
  Write-Output "Execute $_.FullName ..."
  & $_.FullName
}

pause
