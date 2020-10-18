Let' try another plugin call JIB to build docker image with maven. For that <br>

1. Remove the Dockerfile
2. Add the below plugin in pom.xml

            <!-- With below plugin Dockerfile is not needed -->
            <plugin>
                <groupId>com.google.cloud.tools</groupId>
                <artifactId>jib-maven-plugin</artifactId>
                <version>${jib-maven-plugin-version}</version>
                <configuration>
                    <container>
                        <creationTime>USE_CURRENT_TIMESTAMP</creationTime>
                    </container>
                </configuration>
                <executions>
                    <execution>
                        <phase>package</phase>
                        <goals>
                            <goal>dockerBuild</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
            
"USE_CURRENT_TIMESTAMP" - used for re-producibility of images. Means with same source 
code we generate image different times, it will be same image.

<u><b>Note:</u></b> This plugin does not need Dockerfile

3.Run "mvn clean package -DskipTests"
4.A docker image will be created as "project name" as image name and <br>
"project version" as tag. e.g. in this case it will be  <b>firstapp:0.0.1-SNAPSHOT</b>
5. Run the image as:<br>
  <b>docker run -p 8002:8001  firstapp:0.0.1-SNAPSHOT</b>
6. Application will be available at : http://localhost:8002/home

If yoo want to see the details of image creation use the command:<br>
docker history firstapp:0.0.1-SNAPSHOT

Details of the plugin is available at: https://github.com/GoogleContainerTools/jib

