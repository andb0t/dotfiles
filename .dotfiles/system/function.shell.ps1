Write-Output "Load $PSCommandPath ..."

function Compare-Hash {
  $file = $args[0]
  $hash = $args[1]
  $algo = $args[2]

  if (!$file -or !$hash) {
    Write-Output "Missing arguments! Usage:"
    Write-Output "Compare-Hash FILE HASH_VALUE [ALGORITHM]"
    return
  }

  if (!$algo) {
    $algo = "SHA256"
  }

  $fileHash = $(Get-FileHash $file -Algorithm $algo).hash
  $result=$($hash -eq $fileHash)

  Write-Output "Real hash:     $fileHash"
  Write-Output "Expected hash: $hash"
  Write-Host "Equality? : " -NoNewLine

  if ($result -eq $true) {
      write-host "$result" -foregroundcolor Green -backgroundcolor white
  }else{
      write-host "$result" -foregroundcolor Red -backgroundcolor white
  }
}

function x {
  $path = $args[0]
  if (!$path) {
    $path = "."
  }
  explorer.exe $path
}

function paths {
  $EnvName = $args[0]
  if (! $EnvName) {
    $EnvName = "Path"
  }
  (Get-ChildItem Env:$EnvName).Value.Split(";")
}


## Import WSL commands to powershell
# from https://devblogs.microsoft.com/commandline/integrate-linux-commands-into-windows-with-powershell-and-the-windows-subsystem-for-linux/
# The WSL commands to import.
$commands = "awk", "grep", "head", "less", "sed", "tail", "find", "pass", "jq"
# Register a function for each command.
$commands | ForEach-Object { Invoke-Expression @"
Remove-Item $_ -Force -ErrorAction Ignore
function global:$_() {
    for (`$i = 0; `$i -lt `$args.Count; `$i++) {
        # If a path is absolute with a qualifier (e.g. C:), run it through wslpath to map it to the appropriate mount point.
        if (Split-Path `$args[`$i] -IsAbsolute -ErrorAction Ignore) {
            `$args[`$i] = Format-WslArgument (wsl.exe wslpath (`$args[`$i] -replace "\\", "/"))
        # If a path is relative, the current working directory will be translated to an appropriate mount point, so just format it.
        } elseif (Test-Path `$args[`$i] -ErrorAction Ignore) {
            `$args[`$i] = Format-WslArgument (`$args[`$i] -replace "\\", "/")
        }
    }

    if (`$input.MoveNext()) {
        `$input.Reset()
        `$input | wsl.exe $_ (`$args -split ' ')
    } else {
        wsl.exe $_ (`$args -split ' ')
    }
}
"@
}
# Helper function to escape characters in arguments passed to WSL that would otherwise be misinterpreted.
function global:Format-WslArgument([string]$arg, [bool]$interactive) {
  if ($interactive -and $arg.Contains(" ")) {
      return "'$arg'"
  } else {
      return ($arg -replace " ", "\ ") -replace "([()|])", ('\$1', '`$1')[$interactive]
  }
}

# retrieve system information
function sysinfo {
  Get-CimInstance Win32_OperatingSystem | Select-Object  Caption, InstallDate, ServicePackMajorVersion, Version, SerialNumber, OSArchitecture, BootDevice,  BuildNumber | Format-List
  $PSversionTable
}
