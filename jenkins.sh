#!/bin/bash

# Function to install the selected JDK version
install_jdk() {
    case $1 in
        1) sudo apt install openjdk-8-jre-headless -y ;;
        2) sudo apt install default-jre -y ;;
        3) sudo apt install openjdk-11-jre-headless -y ;;
        4) sudo apt install openjdk-17-jre-headless -y ;;
        5) sudo apt install openjdk-19-jre-headless -y ;;
        6) sudo apt install openjdk-20-jre-headless -y ;;
        7) sudo apt install openjdk-21-jre-headless -y ;;
        8) sudo apt install openjdk-22-jre-headless -y ;;
        *) echo "Invalid option selected."; exit 1 ;;
    esac
}

# Display JDK options
echo "Select the JDK version to install:"
echo "1) OpenJDK 8"
echo "2) Default JRE"
echo "3) OpenJDK 11"
echo "4) OpenJDK 17"
echo "5) OpenJDK 19"
echo "6) OpenJDK 20"
echo "7) OpenJDK 21"
echo "8) OpenJDK 22"

# Read user choice
read -p "Enter your choice (1-8): " jdk_choice

# Install the selected JDK
install_jdk $jdk_choice

# Install Jenkins
echo "Installing Jenkins..."

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt-get install jenkins -y

echo "Jenkins installation complete."

############################################################################

# Make the script executable
sudo chmod +x jenkins.sh

# Execute the script
./jenkins.sh
