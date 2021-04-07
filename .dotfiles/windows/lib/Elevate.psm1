# opens a new window with elevated priviliges
function Elevate($psCmdPath) {
    if (Test-Path($psCmdPath)) {
        Write-Host "Elevate: Opening new window with elevated priviliges."

        if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$psCmdPath`"" -Verb RunAs
            exit 
        }
    
        Write-Host "Elevate: Succesfully created a new window with elevated priviliges."
        $true
    } else {
        Write-Error "Elevate: psCmdPath not found: $psCmdPath"
        return $false
    }
}