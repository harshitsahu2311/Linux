#!/bin/bash

echo "Installing Terraform...."

# Update system and install prerequisites
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

# Add the HashiCorp GPG key
wget -q -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

# Verify the fingerprint of the key
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint || { echo "Failed to verify GPG key"; exit 1; }

# Add the HashiCorp repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update and install Terraform
sudo apt-get update
sudo apt-get install -y terraform || { echo "Terraform installation failed"; exit 1; }

# Verify Terraform installation
if command -v terraform &> /dev/null; then
    echo "Terraform installed successfully. Version: $(terraform -v)"
else
    echo "Terraform installation failed"
    exit 1
fi
