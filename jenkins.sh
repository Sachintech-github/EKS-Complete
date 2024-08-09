Install jenkins easy way:

First Install Java (JDK) version that you want:

sudo apt install default-jre              # version 2:1.17-75, or
sudo apt install openjdk-17-jre-headless  # version 17.0.10~6ea-1
sudo apt install openjdk-11-jre-headless  # version 11.0.21+9-0ubuntu1
sudo apt install openjdk-19-jre-headless  # version 19.0.2+7-4
sudo apt install openjdk-20-jre-headless  # version 20.0.2+9-1
sudo apt install openjdk-21-jre-headless  # version 21.0.1+12-3
sudo apt install openjdk-22-jre-headless  # version 22~22ea-1
sudo apt install openjdk-8-jre-headless   # version 8u392-ga-1

then

nano jenkins.sh

sudo apt install openjdk-17-jre-headless -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

 
sudo chmod +x jenkins.sh

./jenkins.sh
