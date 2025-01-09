
#!/bin/sh

# Gather system information and store it in a JSON file
output_file="./system_info.json"
echo '{"data" :"' > "$output_file"
# 1. Type and version of Linux
linux_type_version="$(cat /etc/os-release | grep -e '^NAME=' -e '^VERSION=')"
echo "1. Type and Version of Linux:" >> "$output_file"
linux_type_version=$(echo "$linux_type_version" | tr -d '"')
echo "$linux_type_version" >> "$output_file"
echo "" >> "$output_file"

# 2. Version and type of processor
processor_info="$(cat /proc/cpuinfo)"
echo "2. Version and Type of Processor:" >> "$output_file"
echo "$processor_info" >> "$output_file"
echo "" >> "$output_file"

# 3. Date and time of the system
system_datetime="$(date)"
echo "3. Date and Time of the System:" >> "$output_file"
echo "$system_datetime" >> "$output_file"
echo "" >> "$output_file"

# 4. Amount of occupied space on the hard disk
disk_space_info="$(df -h)"
echo "4. Amount of Occupied Space on the Hard Disk:" >> "$output_file"
echo "$disk_space_info" >> "$output_file"
echo '"}' >> "$output_file"
curl -X POST http://$1:8000/app/post-info/ -H 'Content-Type: application/json' -d  "@./$output_file"  