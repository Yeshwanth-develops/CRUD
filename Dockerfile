# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the executable JAR file from your host machine's target folder to the container's /app folder
# This is the corrected line
COPY target/springboot-thymeleaf-crud-pagination-sorting-webapp-1.0.0.jar app.jar

# Tell Docker to run the JAR file when the container starts
ENTRYPOINT ["java", "-jar", "app.jar"]