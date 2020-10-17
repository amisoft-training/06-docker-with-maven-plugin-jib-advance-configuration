<p>Now we are able to build our docker image with a single maven command. 
With this now let's focus on how to improve our docker image and make 
use of cache.</p>
<p>Let's look into our docker image it has three parts<br>
      1. The JDK <br>
      2. The External libraries, which we have added using maven dependency<br>
      3. The actual <i>class files</i> developed by us<br>
  
 We do not change JDK also the dependencies very frequently. So everytime we 
 build docker image we can avoid building JDK and Dependencies unless there 
 is any change and only build the code.
 
 <p>This can be achieved as :
 
 1. Use plugin :

             <plugin>
                 <groupId>org.apache.maven.plugins</groupId>
                 <artifactId>maven-dependency-plugin</artifactId>
                 <executions>
                     <execution>
                         <id>unpack</id>
                         <phase>package</phase>
                         <goals>
                             <goal>unpack</goal>
                         </goals>
                         <configuration>
                             <artifactItems>
                                 <artifactItem>
                                     <groupId>${project.groupId}</groupId>
                                     <artifactId>${project.artifactId}</artifactId>
                                     <version>${project.version}</version>
                                 </artifactItem>
                             </artifactItems>
                         </configuration>
                     </execution>
                 </executions>
             </plugin>

 Details of the plugin is available at :
  https://maven.apache.org/plugins/maven-dependency-plugin/examples/unpacking-artifacts.html
      
<u><b>Note:</u></b> This plugin must be placed before "dockerfile-maven-plugin".

2. Now comment out the "dockerfile-maven-plugin" for the time being. We shall uncomment it later.

3. Now run the maven command  <b>maven package -DskipTests</b> . This will unpack the dependencies
and the class files along with metadata. 

4. Go to your target folder of the project and you will find a folder named "dependency". Within this
folder there will be "BOOT-INF" folder which will contain .class file as well as
dependency libraries.

5. Now write the DockerFile so that it copies required libraries,class file,metadata
from "target/dependency"

6. Build the docker image as :<br>
   <b>docker build -t amitaucs/firstapp:withunpack . </b>
  
 Now if we make any change in code, only class file will be updated in docker image and for dependencies 
 cache will be used unless there is any change.
 
7. Uncomment the "dockerfile-maven-plugin" 

8. Run "mvn package -DskipTests"

9. Run "docker run -p 8002:8001 amitaucs/firstapp:0.0.1-SNAPSHOT"

10. Application will be available at :<br>
http://localhost:8002/home

