$reg_key= "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout"
$reg_val= "Scancode Map"

# cls  # clear console
write-host "Map caps_lock key to esc! Registry key before change:" -foregroundcolor Red -backgroundcolor white
reg query $reg_key /v $reg_val
reg add $reg_key /v $reg_val /t reg_binary /d 00000000000000000200000001003a0000000000 /f
write-host "Registry key after change:" -foregroundcolor Red -backgroundcolor white
reg query $reg_key /v $reg_val
write-host "Remap done!" -foregroundcolor Red -backgroundcolor white
