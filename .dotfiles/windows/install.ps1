Import-Module -DisableNameChecking $PSScriptRoot\lib\Elevate.psm1 -Force
Import-Module -DisableNameChecking $PSScriptRoot\lib\Script-Failed.psm1  -Force

Write-Information "Install and uninstall software ..."

# force admin rights
if (!(Elevate $PSCommandPath) ){
    ScriptFailed "Elevate failed"
}

# clean up and configure
.("$PSScriptRoot\config.ps1")

# install software
$scripts = @(
  "install_basic_software",
  "install_development_software",
  "install_convenience_software",
#  "install_gaming_software",
  "install_office_software"
)
foreach ($script in $scripts) {
  Write-Output "Execute $PSScriptRoot\install\$script.ps1 ..."
  .("$PSScriptRoot\install\$script.ps1")
}

# create all symlinks
.("$PSScriptRoot\link.ps1")

pause
