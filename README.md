# Network Attack Surface Analyzer Using Custom Nmap NSE Scripts

**Author:** Mayank Raj

## 1. Introduction

Nmap (Network Mapper) is a network exploration and security auditing tool used to discover hosts, open ports, and services running on a network. The Nmap Scripting Engine (NSE) extends Nmap's functionality through scripts written in Lua, allowing users to automate network discovery and service-related tasks.

This project, *Network Attack Surface Analyzer*, demonstrates the development of two custom Nmap NSE scripts for HTTP and SSH service analysis. The scripts use Nmap's `shortport` library to match the relevant ports or identified services and display service information in a structured format.

The project focuses on presenting protocol names, port numbers, and service names in a consistent, readable output. It demonstrates how custom NSE scripts can extend Nmap's existing scanning capabilities with project-specific reporting.

## 2. Project Objectives

The main objectives of this project are:

- To understand the structure and purpose of Nmap NSE scripts.
- To develop custom scripts using the Lua programming language.
- To identify HTTP and SSH services using Nmap's port and service matching functionality.
- To display service information in a structured and readable format.
- To understand how custom script output relates to Nmap's scan results.
- To practise executing custom NSE scripts against authorized test systems.

## 3. Project Structure

The repository contains the following files:

```text
network-attack-surface-analyzer/
│
├── http-service-analyzer.nse
├── ssh-service-analyzer.nse
└── README.md
```

**File descriptions:**

- `http-service-analyzer.nse` — Custom NSE script for displaying HTTP service information.
- `ssh-service-analyzer.nse` — Custom NSE script for displaying SSH service information.
- `README.md` — Project overview, script descriptions, execution instructions, and learning outcomes.

## 4. Script 1: HTTP Service Analyzer

**Script filename:** `http-service-analyzer.nse`

### Description

The HTTP Service Analyzer is designed to display information associated with HTTP services. It uses Nmap's `shortport.port_or_service()` function to match TCP port 80 or a service identified as HTTP.

When the script's action runs, it creates a readable output containing the protocol name, port number, and service name.

### Main Features

- Matches port 80 or the HTTP service name.
- Displays the protocol as HTTP.
- Displays the port number supplied by Nmap.
- Prints the service name in a structured format.
- Uses Lua tables to assemble the output.

### Illustrative Output

```text
=== Network Attack Surface Analysis ===

Protocol : HTTP
Port : 80
Service : HTTP
```

This output illustrates the expected format. The actual port state should be verified using Nmap's scan results.

### Execution Command

Run the following command from the directory containing the script:

```bash
nmap -Pn -p 80 --script ./http-service-analyzer.nse <authorized-target>
```

Replace `<authorized-target>` with the IP address or hostname of a system you own or have permission to test.

## 5. Script 2: SSH Service Analyzer

**Script filename:** `ssh-service-analyzer.nse`

### Description

The SSH Service Analyzer applies a similar reporting structure to SSH services. It uses `shortport.port_or_service()` to match TCP port 22 or a service identified as SSH.

When the script's action runs, it produces structured information containing the protocol name, port number, and service name.

### Main Features

- Matches port 22 or the SSH service name.
- Displays the protocol as SSH.
- Displays the port number supplied by Nmap.
- Prints the service name in a consistent format.
- Uses the same output structure as the HTTP Service Analyzer.

### Illustrative Output

```text
=== Network Attack Surface Analysis ===

Protocol : SSH
Port : 22
Service : SSH
```

This output illustrates the expected format. It is not a claim that a particular SSH server was scanned successfully.

### Execution Command

Run the following command from the directory containing the script:

```bash
nmap -Pn -p 22 --script ./ssh-service-analyzer.nse <authorized-target>
```

Replace `<authorized-target>` with the IP address or hostname of an authorized test system.

## 6. Technologies Used

- **Nmap:** Network exploration and port scanning.
- **Nmap Scripting Engine (NSE):** Framework for executing custom network scripts.
- **Lua:** Programming language used to implement the scripts.
- **Nmap `shortport` library:** Used to match ports or identified service names.
- **GitHub:** Version control and source-code hosting.

## 7. Testing and Results

The scripts are intended to be executed through Nmap against reachable, authorized test systems.

During testing, the output should be checked to confirm that the script displays the expected protocol, port number, and service name.

### 7.1 HTTP Service Analyzer

The HTTP script is configured to match port 80 or a service identified as HTTP. Its output format contains the protocol, port number, and service name.

### 7.2 SSH Service Analyzer

The SSH script is configured to match port 22 or a service identified as SSH. Its output format contains the protocol, port number, and service name.

**Testing note:** Record the actual results from your own Nmap runs here. The displayed sample outputs are illustrative. The scripts themselves do not independently verify whether a port is open, calculate security risk levels, or generate security recommendations.

## 8. Learning Outcomes

Through this project, the following concepts were explored:

- Understanding the purpose and structure of Nmap NSE scripts.
- Writing custom Lua scripts for Nmap.
- Using the `shortport` library for port and service matching.
- Working with Nmap's host and port information passed to script actions.
- Formatting output using Lua tables and string concatenation.
- Executing custom scripts through Nmap command-line options.
- Distinguishing custom script output from Nmap's independently reported port state.
- Organizing source code and project documentation in GitHub.

## 9. Conclusion

The Network Attack Surface Analyzer project demonstrates how custom Nmap NSE scripts can be developed using Lua to display structured information about HTTP and SSH services.

The HTTP Service Analyzer and SSH Service Analyzer use a consistent reporting format to present protocol names, port numbers, and service names. The project provides practical experience with NSE script structure, port and service matching, command-line execution, and source-code documentation.

The project can serve as a foundation for further authorized network-analysis work and more advanced service-information reporting.

## 10. Acknowledgements

I would like to thank the School of Computer Science and Engineering (SCOPE), Vellore Institute of Technology, Chennai, for providing the opportunity to explore cybersecurity concepts through this academic assignment.

I also acknowledge the Nmap project and its contributors for developing and maintaining Nmap, the Nmap Scripting Engine, and its supporting libraries.

Finally, I am grateful to the faculty, peers, and everyone who supported my learning and helped me complete this project.

## 11. Reference

- **Nmap official website:** https://nmap.org/
- **Nmap Scripting Engine documentation:** https://nmap.org/book/nse.html
- **Reference repository used for understanding README organization:** https://github.com/mahekk-hub/nmap-nse-http-enhancements
