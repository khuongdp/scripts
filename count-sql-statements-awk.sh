input=`awk 'END{print RS} /^[0-9]{2}:[0-9]{2}:[0-9]{2}/&& NR>1{print RS}1' ORS= $1`
echo Number of manual/auto commits: `printf "%s\n" "$input" | grep -w '.*COMMIT}.*' | wc -l`
printf "%s\n" "$input" | awk '/{MANUAL COMMIT}|{AUTO COMMIT}/ {x = match($0,/COMMIT.*{no bound values}/); if (x){output=substr($0, RSTART+8, RLENGTH-25); a[substr(output,0, 250)]++}}; END {for(i in a){print a[i],i}}'
