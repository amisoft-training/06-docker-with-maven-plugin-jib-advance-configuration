Earlier project we have deployed our application in docker manually. Now we deployed with DockerFile.
For that we need to do:<br>

1. Write a "Dockerfile"
2. Build a docker image with the command - <br>
  <b> docker build -t amitaucs/firstapp:withdockerfile . </b>
3. Run the docker image as - <br>
  <b>  docker run -p 8002:8001  amitaucs/firstapp:withdockerfile </b>

Goto your browser and access the URL "http://localhost:8002/home". You will find your application is running. 
  
<u><b>Note:</u></b>

1. Do not forget "." in step 2
2. After step 2, you can check the image using the command: <br>
   <b> docker images </b>
3

