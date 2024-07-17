FROM amazoncorretto:17-alpine3.19-jdk AS builder

WORKDIR /app
COPY . .

RUN apk add --no-cache maven && \
    mvn package -Dmaven.test.skip

FROM amazoncorretto:17-alpine3.19-jdk

WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]