# dex-2-hex-coursework

## Task 1 - Github
Create the codebase locally and push up to remote repository in github.

Create Locally: 
- `mkdir Dec2Hex`
- `touch Dec2Hex.java`

*Add java code supplied.

Run the java code:
- Compile:   `javac Dec2Hex.java`
- Run: `java Dec2Hex`

Push local codebase to private remote github repo:
- `git init`
- `git add .`
- `git commit -m "feat: useful message here"`
- `git remote add origin git@github-personal.com:ionawright/dec2hex-coursework.git`
- `git push origin master`

## Task 2 - Deploy VM in AWS / Get Docker running and launch Jenkins container

AWS: https://www.awseducate.com/signin/SiteLogin?ec=302&startURL=%2Fstudent%2Fs%2F

Installing Docker: https://docs.docker.com/engine/install/ubuntu/

- `docker version` (check it is installed)
- `docker image ls -a` list the images (and ones not running)
- `docker container ps -a` list the containers

Run Jenkins container in Docker:
`docker run --rm -d -u root --name jenkins-container -p 8080:8080 -v ~/jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home jenkinsci/blueocean`

## Task 3 - Jenkins Automation

- Detect changes from github: Job - Build Triggers - Poll SCM - Schedule ( * * * * * this means every min) 

Example AWS instance with port: http://ec2-18-207-253-163.compute-1.amazonaws.com:8080/
(port is coming from our command to run the jenkins container in Docker)

## Task 4 - Automate Tests in Jenkins

- SonarQube (SAST) Scans static code for security vulnerabilites
- Example AWS VM with the port: http://ec2-18-207-253-163.compute-1.amazonaws.com:9000/

Run SonarQube container in Docker:
`docker run -d --rm --name sonarqube-container -p 9000:9000 sonarqube`

- Unit Tests (looking at each component, small tests to check functionality)
- Bash script that tests each scenario, this is integrated into the jenkins execute shell to run in each check. Console prints out results. 


## Task 5 - Improve the java project.

- Added another error message "argument must be 1 or above" when nothing is provided.
- Updated the execution errors to 0 as this represents that the code was executed, where as 1 means there was an error.