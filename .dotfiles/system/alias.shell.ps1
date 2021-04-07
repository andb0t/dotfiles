Write-Output "Load $PSCommandPath ..."

Set-Alias l ls
Set-Alias k kubectl
Set-Alias which get-command

# navigation
function .. {Set-Location ..}
function ... {Set-Location ../..}
function .... {Set-Location ../../..}
function cdp {Set-Location $HOME/Projects}
function cddot {Set-Location $DOTFILES_DIR}

# git
Remove-Item alias:gc -Force; function gc {git commit -m $args}
function gd {git diff $args}
function gdc {git diff --cached}
function gs {git status}
Remove-Item alias:gl -Force; function gl {git lol -10}
function gll {git lol}
function gla {git lola}
function gaa {git add -u}
function ga {git add $args}
function gca {git commit --amend}
function gbr {git branch -vv --color=never}

# misc
function elevate {Start-Process Powershell -Verb runAs -ArgumentList "-noexit", "-command Set-Location $pwd"}
function env {Get-ChildItem env:}
function reload! {Write-Output "Reload profile ..."; Invoke-Command { & "powershell.exe" } -NoNewScope}
