# Docker Setup Script for Ubuntu 22.04

This repository contains a script to install Docker, Docker Compose, and optionally various monitoring tools on Ubuntu 22.04. This script automates the installation and configuration process, making it easier to set up a Docker environment with essential monitoring tools.

## Features

- Installs Docker and Docker Compose
- Adds the current user to the Docker group
- Optionally installs monitoring tools:
  - `ctop` - A top-like interface for container metrics
  - `Glances` - A system monitoring tool
  - `Netdata` - Real-time system monitoring
- Enables Docker and Netdata (if installed) to start on boot

## Installation Methods

You can install the script using one of the following methods:

### Method 1: Using `curl`

Download and execute the script using `curl`:

```bash
curl -fsSL https://raw.githubusercontent.com/raman0c17/docker-setup/main/install-docker.sh -o install-docker.sh
chmod +x install-docker.sh
./install-docker.sh
```

### Method 2: Using `wget`

Alternatively, use `wget` to download and run the script:

```bash
wget https://raw.githubusercontent.com/raman0c17/docker-setup/main/install-docker.sh -O install-docker.sh
chmod +x install-docker.sh
./install-docker.sh
```

### Method 3: Cloning the Repository

Clone the repository and run the script:

```bash
git clone https://github.com/raman0c17/docker-setup.git
cd docker-setup
chmod +x install-docker.sh
./install-docker.sh
```

## Installation Process

During the installation, the script will prompt you to choose whether to install each of the following monitoring tools:

- `ctop` - A top-like interface for container metrics
- `Glances` - A system monitoring tool
- `Netdata` - Real-time system monitoring

Simply respond with `y` (yes) or `n` (no) when prompted to install each tool.

## Post-Installation

After the script completes, it is recommended to reboot your system to apply all changes:

```bash
sudo reboot
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Issues

If you encounter any issues or have questions, please open an issue in this repository.

---

**Author:** Raman  
**Repository:** [docker-setup](https://github.com/raman0c17/docker-setup)