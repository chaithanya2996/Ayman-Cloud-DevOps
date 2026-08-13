#!/bin/bash

set -e

echo "Updating package repositories..."
sudo apt update

echo "Installing Java 21 and Fontconfig..."
sudo apt install -y fontconfig openjdk-21-jre

echo "Checking Java version..."
java -version

echo "Creating Jenkins keyring directory..."
sudo mkdir -p /etc/apt/keyrings

echo "Downloading Jenkins repository key..."
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "Adding Jenkins repository..."
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating package repositories..."
sudo apt update

echo "Installing Jenkins..."
sudo apt install -y jenkins

echo "Jenkins installation completed!"

echo "Checking Jenkins service status..."
sudo systemctl status jenkins --no-pager