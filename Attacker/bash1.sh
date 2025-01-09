
#!/bin/bash

# Output CSV file
output_file="/attacker/output.csv"

# Add CSV header
echo "IP Address,Open Ports" > "$output_file"

for host in $(seq 1 254); do
    ip="172.22.0.$host"

    # Run nmap to scan the target IP address
    nmap_output=$(nmap -p- -T4 -Pn "$ip")

    # Check if the nmap output contains the word "open"
    if echo "$nmap_output" | grep -q "open"; then
        # Extract and format the open ports from nmap output
        open_ports=$(echo "$nmap_output" | grep "open" | awk -F '/' '{print $1}' | paste -sd, -)
        # Append the results to the CSV file
        echo "$ip,$open_ports" >> "$output_file"
    fi
done
