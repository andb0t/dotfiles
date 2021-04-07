# Forces to update all Microsoft Store apps
# Source: https://www.reddit.com/r/PowerShell/comments/94ikpc/any_way_to_update_windows_store_apps_via/e3llzpp/
Get-CimInstance -Namespace "Root\cimv2\mdm\dmmap" -ClassName "MDM_EnterpriseModernAppManagement_AppManagement01" | 
Invoke-CimMethod -MethodName UpdateScanMethod