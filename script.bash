# sort | uniq -c = groups user agents and counters their occurances
# sort -nr = groups user agents by frequendy in descending order
# head -n 5 = displays only the top 5 most frequent user agents



echo "Top 5 IP address with the most requests:"
grep -o "^[0-9.]*" ./log_file.txt | sort | uniq -c | sort -nr | awk '{print $2,"- " $1, "requests"}' | head -n 5

printf "\nTop 5 most requested paths:\n"
grep -oE "/v1[^ ]+" ./log_file.txt | sort | uniq -c | sort -nr | awk '{print $2, "- ", $1, "requests"}' | head -n 5 
# done

printf "\nTop 5 most requested status codes:\n"
grep -oE "[[:space:]](200|301|302|400|403|404|500|502|503|504)[[:space:]]" ./log_file.txt | sort | uniq -c | sort -nr | awk '{print $2, "- ", $1, "requests"}' | head -n 5

printf "\nTop 5 most user agents:\n"
grep -oE "(Chrome|Safari|Mozilla|Opera|Edge|MSIE|Trident)[ ]*" ./log_file.txt | sort | uniq -c | sort -nr |awk  '{print $2, "- ", $1, "requests"}' | head -n 5