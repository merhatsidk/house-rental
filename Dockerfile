FROM maven:3-amazoncorretto-17 as build
COPY /src /tmp/src
COPY /pom.xml /tmp/pom.xml
WORKDIR /tmp
RUN mvn package


FROM openjdk:17
COPY --from=build /tmp/target/property-0.0.1-SNAPSHOT.jar /tmp/property-0.0.1-SNAPSHOT.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar" , "/tmp/property-0.0.1-SNAPSHOT.jar"]

