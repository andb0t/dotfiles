# Thanks to raydric, this function should be used instead of `mkdir -force`.
#
# While `mkdir -force` works fine when dealing with regular folders, it behaves
# strange when using it at registry level. If the target registry key is
# already present, all values within that key are purged.
# Source: https://github.com/W4RH4WK/Debloat-Windows-10/blob/master/lib/force-mkdir.psm1
function Force-Mkdir($path) {
    if (!(Test-Path $path)) {
        Write-Host "Force-Mkdir: Creating full path to: " $path -ForegroundColor White -BackgroundColor DarkGreen
        New-Item -ItemType Directory -Force -Path $path
    }
}
