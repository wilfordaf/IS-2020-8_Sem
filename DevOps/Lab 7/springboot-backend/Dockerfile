FROM yannoff/maven:3.8.5-openjdk-17-alpine AS build

WORKDIR /build
COPY .mvn .mvn
COPY mvnw mvnw
COPY mvnw.cmd mvnw.cmd
COPY pom.xml pom.xml
COPY src src
RUN mvn package -DskipTests

FROM openjdk:17-jdk-alpine

RUN apk update && apk add --no-cache bash && rm -rf /var/cache/apk/*
RUN apk add --update --no-cache netcat-openbsd

COPY --from=build /build/target/springboot-backend-0.0.1-SNAPSHOT.jar .

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["entrypoint.sh"]