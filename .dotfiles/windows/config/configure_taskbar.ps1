# hide people band
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d 0 /f
# hide windows ink
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace" /v PenWorkspaceButtonDesiredVisibility /t REG_DWORD /d 0 /f
# show all open apps in taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v VirtualDesktopTaskbarFilter /t REG_DWORD /d 0 /f
# show only apps on current desktop on alt+tab
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v VirtualDesktopAltTabFilter /t REG_DWORD /d 1 /f
# hide search taskbar icon
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f

taskkill /f /im explorer.exe
Start-Process explorer.exe
