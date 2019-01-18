## This repository contains the following:
+ Springboot and Java source code to run a simple "hello-world" application
+ POM file that contains the directory hierarchy structure needed for Maven build and package
+ Dockerfile that builds a container image that runs the application on localhost:8080
## Files in this repository can be fully integrated with Jenkins to automate the build of a container image that can run the application. The steps that Jenkins performs can be broken down below.
1. Jenkins clones this repository from GitHub
2. Jenkins performs a build step using the Maven plugin to build, test, and package the source code into a .jar
3. Jenkins performs a subsequent build step using the CloudBees Docker plugin. The Dockerfile in this repository is referenced to build a Docker image which contains the .jar file.
4. Lastly, the CloudBees Docker plugin will tag the image and push it to the corresponding DockerHub repository. The Dockerhub repository for this project can be found [here.](https://cloud.docker.com/repository/docker/pchen2145/springbootimage)
## Questions comments or updates can be left below. Enjoy!
