# Usage:
# compare_hash FILE HASH_VALUE [ALGORITHM]

$file = $args[0]
$hash = $args[1]
$algo = $args[2]

if (!$algo) {
  $algo = "SHA256"
}

$fileHash = $(Get-FileHash $file -Algorithm $algo).hash
$result=$($hash -eq $fileHash)

echo "File: $fileHash"
echo "Test: $hash"
Write-Host "Comparing $algo of + $file : " -NoNewLine

if ($result -eq $true) {
    write-host "$result" -foregroundcolor Green -backgroundcolor white 
}else{
    write-host "$result" -foregroundcolor Red -backgroundcolor white 
}

