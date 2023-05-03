# Use JDK 16 base image for ARM processors
FROM openjdk:16-jdk-alpine

# Set the working directory
WORKDIR /app

# Copy the source code into the container
COPY . /app

# Check if maven is installed and install it if necessary
RUN mvn --version || { \
    apt-get update && \
    apt-get install -y maven && \
    mvn --version; \
}

# Build the application using Maven
RUN mvn compile && \
    mvn package

# Set the entry point to the Java executable
ENTRYPOINT ["java"]

# Run the application using the jar file built by Maven
CMD ["-jar", "target/url-shortener-0.0.1-SNAPSHOT.jar"]

