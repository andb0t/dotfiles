Write-Output "Load $PSCommandPath ..."

# list last modification data in git repository
function gls {
  if ($args.count -eq 0) {
    $FILES=$(Get-ChildItem).Name
  } else {
    $FILES=$(Get-ChildItem $args).Name
  }
  $MAXLEN=0
  foreach ($f in $FILES) {
    if ($f.Length -gt $MAXLEN) {
      $MAXLEN=$f.Length
    }
  }
  foreach ($f in $FILES) {
    $f_tr=([string]$f).PadRight($MAXLEN, ' ')
    git log -1 --pretty=format:"$f_tr %Cred%h%Creset %<(50,trunc)%s %Cgreen(%cr)%Creset %C(bold blue)<%<(15,trunc)%an>%Creset%n" -- $f
  }
}

# compare local with remote branches and delete the ones without remote counterpart
function gprune {
  git remote prune origin
  $PRUNED=$(git branch -vv | Select-String -Pattern "gone" | ForEach-Object {(([string]$_).Split(' ') | Where-Object {$_})[0]})
  if ($PRUNED.count -eq 0) {
    Write-Output "Nothing to delete."
    return
  }
  if ($args[0] -eq "-D") {
    Write-Output "WARNING: those branches are going to be deleted:"
    Write-Output $PRUNED
    $confirmation = Read-Host "Do you wish to delete those branches? (Y/[n])"
    if ($confirmation -eq 'y' -or $confirmation -eq 'Y' ) {
        foreach ($item in $PRUNED) {
          git branch -D $item
        }
    } else {
      Write-Output "Abort."
      return;
    }
  } else {
    foreach ($item in $PRUNED) {
      git branch -d $item
    }
    Write-Output "If this wasn't successful, try running: $((Get-PSCallStack)[0].FunctionName) -D"
  }
  Write-Output "Current branches:"
  gbr
}
