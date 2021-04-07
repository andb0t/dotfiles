$SYMLINK_FILE = "$env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$TARGET_FILE = "$PSScriptRoot\..\software\terminal\settings.json"

New-Item -ItemType SymbolicLink -Force -Path "$SYMLINK_FILE" -Target "$TARGET_FILE"
