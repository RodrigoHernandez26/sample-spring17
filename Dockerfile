# Use a slim Java 17 image with Alpine Linux
FROM amazoncorretto:17-alpine3.19-jdk AS builder

# Set working directory for the build stage
WORKDIR /app

# Copy your application code (replace with your build command if needed)
COPY . .

# Install Maven
RUN apk add --no-cache maven

# Build your application using Maven or Gradle (adjust based on your build tool)
RUN mvn package

# Create a slim runtime image based on the builder stage
FROM amazoncorretto:17-alpine3.19-jdk

# Set working directory for the runtime stage
WORKDIR /app

# Copy the application JAR from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose the port your Spring application listens on (replace with your port)
EXPOSE 8080

# Command to start the application
ENTRYPOINT ["java", "-jar", "app.jar"]