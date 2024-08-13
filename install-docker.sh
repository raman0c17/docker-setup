#!/bin/bash

# Update and upgrade system packages
echo "Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install dependencies for Docker
echo "Installing dependencies..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg-agent \
    lsb-release

# Add Docker’s official GPG key
echo "Adding Docker's GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable Docker repository
echo "Adding Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index again
echo "Updating package index..."
sudo apt-get update -y

# Install Docker Engine
echo "Installing Docker Engine..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Docker Compose
echo "Installing Docker Compose..."
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Add user to the docker group
echo "Adding user to docker group..."
sudo usermod -aG docker $USER

# Install monitoring tools: ctop, Glances, and netdata

# Install ctop (top-like interface for container metrics)
echo "Installing ctop..."
sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.7/ctop-0.7.7-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop

# Install Glances (system monitoring tool)
echo "Installing Glances..."
sudo apt-get install -y glances

# Install netdata (real-time system monitoring)
echo "Installing Netdata..."
bash <(curl -Ss https://my-netdata.io/kickstart.sh)

# Enable Docker and Netdata to start on boot
echo "Enabling Docker and Netdata services to start on boot..."
sudo systemctl enable docker
sudo systemctl enable netdata

# Done
echo "Installation completed! Please reboot your system to apply all changes."
