header="Cmd,Timestamp,RealT,UsrT,SysT,Proc,Status"
fmt="%C,'$(date)',%e,%U,%S,%P,%x"
timestamp=$(date -u +"%Y-%m-%dT%H-%M-%SZ")
out=/tmp/time_profiling_"$timestamp".csv

echo "Start time profiling ..."
echo $header > $out
time -a -f "$fmt" -o "$out" ls 1>/dev/null 2>&1
time -a -f "$fmt" -o "$out" pwd 1>/dev/null 2>&1
time -a -f "$fmt" -o "$out" echo hi 1>/dev/null 2>&1
time -a -f "$fmt" -o "$out" git status 1>/dev/null 2>&1
time -a -f "$fmt" -o "$out" git symbolic-ref HEAD 1>/dev/null 2>&1
time -a -f "$fmt" -o "$out" git diff-index --quiet HEAD -- 1>/dev/null 2>&1
time -a -f "$fmt" -o "$out" git rev-parse 1>/dev/null 2>&1
time -a -f "$fmt" -o "$out" git diff --exit-code --quiet 1>/dev/null 2>&1
time -a -f "$fmt" -o "$out" git log @{u}..HEAD --oneline 1>/dev/null 2>&1
echo "Clean output file ..."
sed -i '/Command exited with.*/d' $out
echo "Done!"
column -s, -t < $out
echo "Output saved in $out"
