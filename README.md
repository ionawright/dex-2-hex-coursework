# dex-2-hex-coursework

## Task 1 - Github
Create the codebase locally and push up to remote private repository in github.

Create Directory
- `mkdir Dec2Hex`
- `touch Dec2Hex.java`

Run the java code:
Compile:   `javac Dec2Hex.java`
Run: `java Dec2Hex`

Push local codebase to private remote github repo:
- `git init`
- `git add .`
- `git commit -m "feat: useful message here"`
- `git remote add origin git@github-personal.com:ionawright/dec2hex-coursework.git`
- `git push origin master`

## Task 2 - AWS / Docker
Deploy an EC2 Instance in AWS, install Docker and launch a Jenkins container using Docker. (Lab 4)

Visit https://www.awseducate.com/signin/SiteLogin?ec=302&startURL=%2Fstudent%2Fs%2F

Install Docker:

`sudo apt-get update` : downloads the package lists from the repositories and "updates" them to get information on the newest versions of packages and their dependencies.

`sudo apt-get -y remove unscd` :
unscd = Micro Name Service Caching Daemon. Uninstalls software that is not required?

`sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common` Installs docker on Ubuntu. Update the apt package index and install packages to allow apt to use a repository over HTTPS: Link: https://docs.docker.com/engine/install/ubuntu/

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -` Add dockers official GPG key. Linux package managers have the ability to validate the integrity of a software package before installation by verifying it's PGP (GPG) key

`sudo apt-key fingerprint 0EBFCD88` Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint

s`udo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" Set up a stable repository.

`sudo apt-get update` Update the apt package index (again)

`sudo apt-get -y install docker-ce docker-ce-cli containerd.io` Install the latest version of Docker Engine and containerd

`sudo groupadd docker` Creates the docker group. If you don't want to preface the docker command with sudo creating the Unix group allows you to add users to it.

`sudo usermod -aG docker $USER` Add user

`sudo addgroup --system docker` Add users to the group (system) docker

`sudo adduser $USER docker`

`newgrp docker` On Linux, you can run this command to activate changes to the group.
*sudo defaults to superuser and allows the user to run programs with security privilidges of superuser.

`docker version` Going to run this command to test we can run commands without sudo.

`docker run hello-world` If not able to find locally docker will pull the image down. Also given a nice message that the installation is working correctly.

`docker container run alpine hostname` Again, we have another image alpine - it can't be found locally so docker pulls down the image

`docker ps -a` Shows us the containers we have just pulled down.

`docker container run alpine:edge ps` Run another version of alpine - specified after the : (edge)

List all the images / containers: docker image ls -a : list all the containers, even those not running. docker ps -a : list all the containers. docker ps -l : list the last image pulled.

After installing docker, run the jenkins container: 20. docker run --rm -d -u root --name jenkins-container -p 8080:8080 -v ~/jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home jenkinsci/blueocean (Lab5)

## Docker containers running: 

Jenkins:
`docker run --rm -d -u root --name jenkins-container -p 8080:8080 -v ~/jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home jenkinsci/blueocean`

SonarQube:
`docker run -d --rm --name sonarqube-container -p 9000:9000 sonarqube`

## Task 3 - Jenkins
Configure Jenkins to automatically:


- Detect changes to your remote GitHub repository 
- Build your code
- Ensure that your code runs successfully

Example: http://ec2-18-207-253-163.compute-1.amazonaws.com:8080/

## Task 4 - Automate Tests Jenkins

- SonarQube (SAST) Scans static code for security vulnerabilites
- Example AWS VM with the port: http://ec2-18-207-253-163.compute-1.amazonaws.com:9000/


## Task 5 - Improve the java project.

- Added another error message "argument must be 1 or above" when nothing is provided.
- Updated the execution errors to 0 as this represents that the code was executed, where as 1 means there was an error.