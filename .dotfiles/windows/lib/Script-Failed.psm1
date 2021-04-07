# marks a script as failed
function ScriptFailed($reason) {
    throw "ScriptFailed: The script failed and cannot continue: $reason"
}