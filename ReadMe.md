Let's do it manually:

1. Run "mvn clean install" to build jar file
2. Get the jdk image
3. copy the .jar file
4. Run the jar

<b><u>The docker commands:</u></b>

<u>Note:</u> After command 1 , please run "docker ps". This command will show you the container name. 
Replace <your container name> with the name of the container.

1. docker run -dit openjdk:8-jdk-alpine
2. docker container exec <your container name> ls /tmp
3.docker container cp target/firstapp-0.0.1-SNAPSHOT.jar <your container name>:/tmp
4.docker container exec <your container name> ls /tmp
5.docker container commit <your container name> amitaucs/firstapp:latest
6.docker run amitaucs/firstapp:latest
7.docker container ls
8.docker container commit --change='CMD ["java","-jar","/tmp/firstapp-0.0.1-SNAPSHOT.jar"]' <your container name> amitaucs/firstapp:latest
9.docker run -p 8002:8001 amitaucs/firstapp:latest

Goto your browser and access the URL "http://localhost:8002/home". You will find your application is running.

<b><u>What next:</u></b>

We deployed our code manually using Docker. Next we shall write a DockerFile which will allow us to deploy 
our code with less code.