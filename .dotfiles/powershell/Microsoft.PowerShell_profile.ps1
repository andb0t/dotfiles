########## Powershell config file ############

# Prompt
echo "Reading config file $profile ..."
echo ""

# Aliases
Set-Alias l ls
function .. {cd ..}
function ... {cd ../..}

# Make powershell close on ctrl+d
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

# Configure prompt
function Test-IsAdmin {
  ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
}

function Prompt
{
 # Define current path string
  $dirSep = [IO.Path]::DirectorySeparatorChar
  $LOCATION = ([string]$PWD.path).Replace("C:\Users\$env:UserName", "~")
  $pathComponents = $LOCATION.Split($dirSep)
  $LOCATION = if ($pathComponents.Count -le 3) {
    $LOCATION
  } else {
    '...{0}{1}' -f $dirSep, ($pathComponents[-2,-1] -join $dirSep)
  }
  # Other
  $ESC = [char]27  # color escape string
  # Change prompt if admin
  if (Test-IsAdmin) {
    $INLINE_PROMPT = "$ESC[91m" + "> " + "$ESC[0m"
  } else {
    $INLINE_PROMPT = "> "
  }
  # Set window title
  $host.ui.RawUI.WindowTitle = "$env:ComputerName" + ":" + " $LOCATION"
  # Finally, set prompt
  "$env:UserName" + "@" + "$env:ComputerName" + ": " + 
  "$ESC[96m" + "$LOCATION" + "$ESC[0m" +
  "`r`n" + 
  "$INLINE_PROMPT"
}
