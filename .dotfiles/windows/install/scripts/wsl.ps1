# Enable WSL fature in admin powershell (will restart the PC)
# maybe not necessary, see https://github.com/microsoft/windows-dev-box-setup-scripts/blob/master/scripts/WSL.ps1
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

# install hyper-v
choco install -y Microsoft-Hyper-V-All --source="'windowsFeatures'"

# install wsl
choco install -y Microsoft-Windows-Subsystem-Linux --source="'windowsfeatures'"

# install ubuntu
choco install wsl-ubuntu-2004 -y

RefreshEnv

# prepare the environment (commented out since usually done from within WSL)
#Ubuntu2004 install --root
#Ubuntu2004 run apt update
#Ubuntu2004 run apt upgrade -y
