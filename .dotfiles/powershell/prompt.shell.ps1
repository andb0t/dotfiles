Write-Output "Load $PSCommandPath ..."

$ESC = [char]27  # color escape string
$RESET_COLOR ="$ESC[0m"
$RED = "$ESC[91m"
$RED_BKG = "$ESC[41m"
$GREEN = "$ESC[92m"
$YELLOW = "$ESC[93m"
$MAGENTA = "$ESC[95m"
$CYAN = "$ESC[96m"

function Test-IsAdmin {
  # Configure prompt
  ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
}

function Get-Prompt-Unpushed {
  $revision = (git rev-parse --symbolic-full-name "@{push}" 2>$null)
  git cherry -v ${revision} 2>$null
}

function Get-Prompt-Need-Push {
  if (-Not (Get-Prompt-Unpushed)) {
    ""
  } else {
    $N_PUSHES = (git log "@{u}..HEAD" --oneline | Measure-Object -Line).Lines
    $PUSH_ELEMENT = "$([char]0x2191)"
    $PUSH_STRING = if ($N_PUSHES -gt 4) {
      " $N_PUSHES" + "x" + "$PUSH_ELEMENT"
    } else {
      "$PUSH_ELEMENT" * $N_PUSHES
    }
    $MAGENTA + $PUSH_STRING + $RESET_COLOR
  }
}

function Get-Prompt-Git-Dirty {
  # Add branch info if git repo
  $x=git rev-parse
  if ($LastExitCode) {
    ""
  } else {
    # get branch name
    $x=git symbolic-ref HEAD
    $BRANCH_NAME= if ($LastExitCode -ne 0) {
      (git rev-parse --short HEAD)
    } else {
      (git rev-parse --abbrev-ref HEAD)
    }
    # Determine if dirty
    $x=git diff --exit-code --quiet --cached
    $x=$LastExitCode
    $y=git diff --exit-code --quiet
    $y=$LastExitCode
    $COLOR = if ($x -ne 0) {
      $YELLOW
    } elseif ($y -ne 0) {
      $RED
    } else {
      $GREEN
    }
    $CACHED_STRING = if ($x -ne 0) {
      $CACHED_ELEMENT="$([char]0x25CF)"
      $N_CACHED = (git diff --cached --shortstat).Split(" file")[1]
      if ($N_CACHED -gt 4) {
        " $N_CACHED" + "x" + "$CACHED_ELEMENT"
      } else {
        "$CACHED_ELEMENT" * $N_CACHED
      }
    } else {
      ""
    }
    " (" + $COLOR + $BRANCH_NAME + $CACHED_STRING + $RESET_COLOR + (Get-Prompt-Need-Push) + ")"
  }
}

function Prompt {

  $realLASTEXITCODE = $?

  # Define current path string
  $dirSep = [IO.Path]::DirectorySeparatorChar
  $LOCATION = ([string]$PWD.path).Replace("C:\Users\$env:UserName", "~")
  $pathComponents = $LOCATION.Split($dirSep)
  $LOCATION = if ($pathComponents.Count -le 3) {
    $LOCATION
  } else {
    '...{0}{1}' -f $dirSep, ($pathComponents[-2,-1] -join $dirSep)
  }
  # Set window title
  $host.ui.RawUI.WindowTitle = "$env:ComputerName" + ":" + " $LOCATION"

  # Change prompt if admin
  if (Test-IsAdmin) {
    $INLINE_PROMPT = $RED + ">" + $RESET_COLOR
  } else {
    $INLINE_PROMPT = ">"
  }

  # create left prompt
  $LEFT_PROMPT = "$env:UserName" + "@" + "$env:ComputerName" + ": " +
  $CYAN + "$LOCATION" + $RESET_COLOR +
  (Get-Prompt-Git-Dirty)

  # create right prompt
  $DATE="{0:H:mm:ss}" -f (get-date)
  $RIGHT_PROMPT_INVIS = ""
  $RIGHT_PROMPT = if (-NOT $realLASTEXITCODE) {
    $RIGHT_PROMPT_INVIS = $RED_BKG + $RESET_COLOR
    $RED_BKG + "$realLASTEXITCODE" + $RESET_COLOR + " [$DATE]"
  } else {
    "[$DATE]"
  }

  # Finally, set prompts
  # top left
  $Host.UI.Write($LEFT_PROMPT)
  # right aligned top right
  $HORIZONTAL_SPACE = $Host.UI.RawUI.windowsize.width - $Host.UI.RawUI.CursorPosition.X - $RIGHT_PROMPT.length + $RIGHT_PROMPT_INVIS.length - 3
  $Host.UI.Write(" " + "$([char]0x2500)" * $HORIZONTAL_SPACE + " ")
  $Host.UI.Write($RIGHT_PROMPT)
  # bottom left
  $Host.UI.Write("`r`n")
  $Host.UI.Write($INLINE_PROMPT)

  # reset last exit code
  $global:LASTEXITCODE = $realLASTEXITCODE
  return " "
}
