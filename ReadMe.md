Here we use a maven plugin to generate the Docker image with a maven command.
For that we did:

1. Added a maven plugin in pom.xml
         
                    <plugin>
                       <groupId>com.spotify</groupId>
                       <artifactId>dockerfile-maven-plugin</artifactId>
                       <version>${docker-plugin-version}</version>
                       <executions>
                           <execution>
                               <id>default</id>
                               <goals>
                                   <goal>build</goal>
                               </goals>
                           </execution>
                       </executions>
                       <configuration>
                           <repository>amitaucs/${project.name}</repository>
                           <tag>${project.version}</tag>
                           <skipDockerInfo>true</skipDockerInfo>
                       </configuration>
                   </plugin>

   Details of the plugin is available at Git location 
   
   https://github.com/spotify/dockerfile-maven.git
   
   Here docker repository is : amitaucs/firstApp 
   and the image version is : 0.0.1-SNAPSHOT
   
   <u><b>Note :</u></b> these are the field in pom 
            <name>firstapp</name>  -> project.name
            <version>0.0.1-SNAPSHOT</version>  -> project.version
            
2. Run the maven command :
     <b> mvn package -DskipTests </u>
     
  A docker image of the application will be build as :
  Successfully built amitaucs/firstapp:0.0.1-SNAPSHOT

<u><b> Note: </u></b> Do not use "-DskipTests" while building image for production. As you need to 
ensure all tests are passed.

3. Run the docker image with the command:
 <u><b>  docker run -p 8002:8080  amitaucs/firstapp:0.0.1-SNAPSHOT <u></b>
 
4. Application will be available at :
     http://localhost:8002/home

     

