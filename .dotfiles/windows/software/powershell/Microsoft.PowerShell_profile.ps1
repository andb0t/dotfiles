########## Powershell config file ############

# Prompt
Write-Output "Load $PSCommandPath ..."

# source files with .shell.ps1 extension
$DOTFILES_DIR = "$HOME\.dotfiles"
$sourcefiles = Get-Childitem -Path "$DOTFILES_DIR" -Include "*.shell.ps1" -File -Recurse
foreach ($f in $sourcefiles) {
  .($f)
}

# Make powershell close on ctrl+d
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
