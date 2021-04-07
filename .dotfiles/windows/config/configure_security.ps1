write-host "Enable Potentially Unwanted Application (PUA) protection" -foregroundcolor Red -backgroundcolor white
Set-MpPreference -PUAProtection 1  # set to 0 to disable
write-host "Enable network protection (suspicious hosts)" -foregroundcolor Red -backgroundcolor white
Set-MpPreference -EnableNetworkProtection Enabled
# write-host "Enable Attack Surface Reduction (ASR)" -foregroundcolor Red -backgroundcolor white
# add user specific settings here
write-host "Set User Account Control (UAC) to maximum" -foregroundcolor Red -backgroundcolor white
$reg_key= "HLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$reg_val= "EnableLUA"
write-host "Registry key before change:" -foregroundcolor Red -backgroundcolor white
reg query $reg_key /v $reg_val
reg add $reg_key /v $reg_val /t reg_dword /d 0x1 /f
write-host "Registry key after change:" -foregroundcolor Red -backgroundcolor white
reg query $reg_key /v $reg_val
