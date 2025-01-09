# Penetration Testing Simulation with Docker

## Introduction
This project is designed to simulate penetration testing in a controlled environment. The primary objective is to identify a target system, establish a connection, and execute a Bash script to retrieve system information. The project is divided into multiple phases, focusing on the attacker and victim systems.

## Project Overview

### 1. **Attacker**
The attacker phase consists of two key components:
- **`sh.bash`**: A Bash script that identifies reachable subnets and IP addresses, checks for open ports using `nmap`, and stores the results in an output file.
- **`py.merge`**: A Python script that combines username and password CSV files to generate all possible combinations and stores them in a CSV file for login attempts.

This phase also includes a shell script that attempts to log into target systems using the `sshpass` tool with credentials generated earlier.

#### **Key Features:**
- Reads IP addresses and login credentials from CSV files.
- Uses `sshpass` to attempt login with each credential pair.
- Logs successful and unsuccessful attempts in a structured output file.

---

### 2. **Victim**
The victim phase involves setting up a network simulation using Docker to mimic real-world environments. It includes the following components:
- A Docker-based network (`testnet`) with target servers and services.
- A web server to facilitate communication.
- An attacker machine for executing tests within the simulated network.

#### **Key Features:**
- **Target Servers**: Three Docker containers with services like SSH, FTP, and `crond` enabled.
- **Web Server**: A container running on `testnet` with port 8000 mapped to the host.
- **Attacker Machine**: A Docker container connected to `testnet` for running attack scripts interactively.

---

### 3. **Automation Scripts**

#### **Bash Scripts for Setup**
- Creates a Docker network and initializes target servers, web servers, and attacker machines.
- Configures and launches services like SSH and FTP within the target servers.

#### **Dockerfile**:
- Builds Docker images with essential tools (e.g., `nmap`, `sshpass`, `curl`, `bash`).
- Configures system settings to allow root login and password authentication.

#### **Information Gathering Script** (`sh.script`):
- Collects system information (e.g., OS type, CPU info, disk usage).
- Saves data as a JSON file and sends it to a specified web address using `curl`.

---

## Usage Instructions

### Prerequisites
- Docker installed on your system.
- Python 3 for running the `py.merge` script.
- `nmap` and `sshpass` installed for network scanning and automated login attempts.

### Steps to Run

#### 1. **Setting up the Victim Environment**
- Build Docker images using the provided `Dockerfile`.
- Run the setup Bash script to create the `testnet` network and initialize target servers, web server, and attacker machine.

#### 2. **Running the Attacker Scripts**
- Execute `sh.bash` to identify reachable IPs and open ports.
- Run `py.merge` to generate login credential combinations.
- Use the login automation script to attempt connections to the identified targets.

#### 3. **Information Gathering**
- Deploy the `sh.script` on the attacker machine.
- Collect and send system information to the web server.

---

## File Structure
```bash
project/
├── attacker/
│   ├── sh.bash          
│   ├── py.merge         
│   ├── login_automation 
│
├── victim/
│   ├── Dockerfile       
│   ├── setup.sh         
│   ├── sh.script        
│
├── web/
│   ├── DjangoApp/       
│   ├── manage.py        
│
└── README.md            
```

## Example Outputs

1. **Network Scanning Results**:
    IP Address: 192.168.1.1 Open Ports: 22, 80

2. **Successful Logins**:
    Username: admin Password: password123 Status: Success

3. **System Information (JSON)**:
    ```json
    {
        "OS": "Ubuntu 20.04",
        "CPU": "Intel(R) Core(TM) i7-9700K",
        "Disk_Usage": "50% used"
    }
    ```
## Contributors

- **Sayin Ala**
- **Golbarg Sepehrara**

Supervised by:

- **Dr. Diyanat**