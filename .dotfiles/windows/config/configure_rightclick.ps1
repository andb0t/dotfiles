##############################################
# Configure rightclick menu
##############################################
Set-PSDebug -Trace 0
################# General ####################
# remove MS Azure "Classify and protect"
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shell\Microsoft.Azip.RightClick" /f
# remove "Give access to"
reg add "HLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /f
reg add "HLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /t REG_SZ /f
# add "Open Powershell here"
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\powershellmenu" /t reg_sz /d "Open Powershell here" /f
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\powershellmenu\command" /t reg_sz /d "powershell.exe -NoExit -Command Set-Location -LiteralPath '%V'" /f
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\powershellmenu" /v "Icon" /t reg_sz /d "%HOMEPATH%\Pictures\powershell.ico" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\powershellmenu" /t reg_sz /d "Open Powershell here" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\powershellmenu\command" /t reg_sz /d "powershell.exe -NoExit -Command Set-Location -LiteralPath '%L'" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\powershellmenu" /v "Icon" /t reg_sz /d "%HOMEPATH%\Pictures\powershell.ico" /f
# add "Open bash here"
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\bash" /t reg_sz /d "Open Ubuntu shell here" /f
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\bash\command" /t reg_sz /d "C:\Windows\System32\bash.exe" /f
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\bash" /v "Icon" /t reg_sz /d "%HOMEPATH%\Pictures\bash.ico" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\bash" /t reg_sz /d "Open Ubuntu shell here" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\bash\command" /t reg_sz /d "C:\Windows\System32\bash.exe" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\bash" /v "Icon" /t reg_sz /d "%HOMEPATH%\Pictures\bash.ico" /f

################# Files ######################
# remove "Send to"
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" /f
# remove "Send with Transfer..."
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\DropboxExt" /f
# remove "Restore previous versions"
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f

############### Directories ##################
# remove "Send to"
reg delete "HKEY_CLASSES_ROOT\UserLibraryFolder\shellex\ContextMenuHandlers\SendTo" /f
# remove "Send with Transfer..."
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\DropboxExt" /f
# always show "Open in Powershell"
reg delete "HKEY_CLASSES_ROOT\Directory\shell\Powershell" /v "Extended" /f
# remove "Open in Visual Studio"
reg delete "HKEY_CLASSES_ROOT\Directory\shell\AnyCode"/f
# remove "Restore previous versions"
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
# remove "Include in library"
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Library Location" /f
# remove "Pin to start"
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f
# remove "Pin to quick access"
reg delete "HKEY_CLASSES_ROOT\Folder\shell\pintohome" /f
# remove "New/Microsoft Access Database"
reg delete "HKEY_CLASSES_ROOT\.accdb\ShellNew" /f
reg delete "HKEY_CLASSES_ROOT\.mdb\ShellNew" /f
# remove "New/Microsoft Publisher Document"
reg delete "HKEY_CLASSES_ROOT\.pub\Publisher.Document.16\ShellNew" /f
# remove "New/Bitmap Image"
reg delete "HKEY_CLASSES_ROOT\.bmp\ShellNew" /f
# remove "New/Contact"
reg delete "HLM\SOFTWARE\Classes\.contact\ShellNew" /f
# remove "New/Richt Text Format"
reg delete "HLM\SOFTWARE\Classes\.rtf\ShellNew" /f
# remove "New/Microsoft PowerPoint Presentation"
reg delete "HLM\SOFTWARE\Classes\.pptx\PowerPoint.Show.12\ShellNew" /f
# remove "New/Compressed Folder"
reg delete "HLM\SOFTWARE\Classes\.zip\CompressedFolder\ShellNew" /f
# remove "New/Shortcut"
reg delete "HLM\SOFTWARE\Classes\.lnk\ShellNew" /f

############### Background ###################
# remove "Send with Transfer..."
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\DropboxExt" /f
# remove "Open in Visual Studio"
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\AnyCode" /f
# remove "Customize this folder"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoCustomizeThisFolder" /t REG_DWORD /d 1 /f

Set-PSDebug -off
