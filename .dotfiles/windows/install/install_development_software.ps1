# Utils
choco install git -y
choco install make -y
choco install shellcheck -y
choco install vim -y
choco install azure-cli -y
choco install kubernetes-cli -y
choco install microsoft-windows-terminal -y
choco install postman -y

# IDEs
choco install vscode -y
# choco install atom -y
# choco install pycharm-community -y
# choco install intellijidea-community -y

# Programming languages
.("$PSScriptRoot\scripts\python.ps1")
.("$PSScriptRoot\scripts\angular.ps1")
choco install nodejs -y
choco install dotnetcore-sdk -y

refreshenv
