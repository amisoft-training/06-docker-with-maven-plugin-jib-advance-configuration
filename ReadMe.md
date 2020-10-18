Let' try now try to configure JIB to customize docker image with maven. 
e.g. We can specify the Java base image, repository etc. For that <br>

1. Remove the Dockerfile
2. Add the below plugin in pom.xml

          <plugin>
                          <groupId>com.google.cloud.tools</groupId>
                          <artifactId>jib-maven-plugin</artifactId>
                          <version>${jib-maven-plugin-version}</version>
                          <configuration>
                              <from>
                                  <image>openjdk:alpine</image>
                              </from>
                              <to>
                                  <image>amitaucs/${project.name}</image>
                                  <tags>
                                      <tag>${project.version}</tag>
                                      <tag>latest</tag>
                                  </tags>
                              </to>
                              <container>
                                  <jvmFlags>
                                      <jvmFlag>-Xms512m</jvmFlag>
                                  </jvmFlags>
                                  <mainClass>com.amisoft.docker.firstapp.FirstappApplication</mainClass>
                                  <ports>
                                      <port>8001</port>
                                  </ports>
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
            
<u><b>Note:</u></b> This plugin does not need Dockerfile

3.Run "mvn clean package -DskipTests"
4.A docker image will be created as : <b> amitaucs/firstapp:0.0.1-SNAPSHOT</b>
5. Run the image as:<br>
  <b>docker run -p 8002:8001   amitaucs/firstapp:0.0.1-SNAPSHOT</b>
6. Application will be available at : http://localhost:8002/home

If yoo want to see the details of image creation use the command:<br>
docker history amitaucs/firstapp:0.0.1-SNAPSHOT

Details of the plugin is available at: https://github.com/GoogleContainerTools/jib

<u><b>Please note :</u></b> JIB is Java specific. It is good for simple projects 
which does not have much complexity.