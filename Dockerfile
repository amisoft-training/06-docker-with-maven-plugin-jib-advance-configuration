FROM openjdk:8-jdk-alpine
ADD target/firstapp-0.0.1-SNAPSHOT.jar  firstapp-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["sh","-c", "java -jar /firstapp-0.0.1-SNAPSHOT.jar"]