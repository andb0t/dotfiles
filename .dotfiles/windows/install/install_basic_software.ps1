# install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install other software
choco install 7zip.install -y
choco install burnttoast-psmodule -y
choco install firefox-dev --pre -y
choco install thunderbird -y
choco install protonmailbridge -y
choco install vlc -y
choco install sumatrapdf -y
choco install irfanview -y
choco install protonvpn -y
choco install qbittorrent -y

.("$PSScriptRoot*\scripts\wsl.ps1")
.("$PSScriptRoot\scripts\docker.ps1")

refreshenv
