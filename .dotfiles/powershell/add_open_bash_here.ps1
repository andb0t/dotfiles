$reg_key_outer = "HKEY_CLASSES_ROOT\Directory\Background\shell\bash"
$reg_key_inner = "HKEY_CLASSES_ROOT\Directory\Background\shell\bash\command"
$reg_val = "Icon"

# cls  # clear console
reg add $reg_key_outer /t reg_sz /d "Open Ubuntu shell here"
reg add $reg_key_inner /t reg_sz /d "C:\Windows\System32\bash.exe"
reg add $reg_key_outer /v $reg_val /t reg_sz /d "%HOMEPATH%\Pictures\bash.ico"
