Enable-WindowsOptionalFeature -Online -FeatureName containers -All
RefreshEnv
choco install docker-for-windows -y
