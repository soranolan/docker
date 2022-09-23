#
# Build stage
#
FROM gradle:7.5.1-jdk11 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

#
# Package stage
#
FROM openjdk:11
RUN mkdir /app
COPY --from=build /home/gradle/src/build/libs/docker-0.0.1-SNAPSHOT.jar /app/docker-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","docker-0.0.1-SNAPSHOT.jar"]