##############################################
# Configure rightclick menu
##############################################

################# General ####################
# remove MS Azure "Classify and protect"
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shell\Microsoft.Azip.RightClick" /f
# remove "Give access to"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /t REG_SZ
# move "Open PowerShell window here" from shift+right-click to right-click
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\cmd" /v "ShowBasedOnVelocityId" /t REG_DWORD /d 0x639bc8
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\cmd" /v "HideBasedOnVelocityId" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\cmd" /v "ShowBasedOnVelocityId" /t REG_DWORD /d 0x639bc8
reg delete "HKEY_CLASSES_ROOT\Directory\shell\cmd" /v "HideBasedOnVelocityId" /f
reg add "HKEY_CLASSES_ROOT\Drive\shell\cmd" /v "ShowBasedOnVelocityId" /t REG_DWORD /d 0x639bc8
reg delete "HKEY_CLASSES_ROOT\Drive\shell\cmd" /v "HideBasedOnVelocityId" /f

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
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.contact\ShellNew" /f
# remove "New/Richt Text Format"
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.rtf\ShellNew" /f
# remove "New/Microsoft PowerPoint Presentation"
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.pptx\PowerPoint.Show.12\ShellNew" /f
# remove "New/Compressed Folder"
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.zip\CompressedFolder\ShellNew" /f
# remove "New/Shortcut"
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.lnk\ShellNew" /f

############### Background ###################
# remove "Send with Transfer..."
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\DropboxExt" /f
# remove "Open in Visual Studio"
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\AnyCode" /f
# always show "Open in Powershell"
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\Powershell" /v "Extended" /f
# remove "Customize this folder"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoCustomizeThisFolder" /t REG_DWORD /d 1

