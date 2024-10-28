#!/bin/bash

# Check for Docker, install if missing
if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing Docker..."
    sudo apt update
    sudo apt install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
else
    echo "Docker is already installed."
fi

# Pull noVNC + xfce Docker image
echo "Pulling Docker image with noVNC and xfce..."
docker pull dorowu/ubuntu-desktop-lxde-vnc

# Run the Docker container
echo "Running Docker container..."
docker run -d --name windows11_novnc -p 8081:8081 dorowu/ubuntu-desktop-lxde-vnc

# Provide instructions for access
echo "Container is running. Access the noVNC session at http://localhost:8081"
