
FROM maven:3.8.3-openjdk-16

# Set the working directory
WORKDIR /app

# Copy the source code into the container
COPY . /app

# Check if maven is installed and install it if necessary


# Build the application using Maven
RUN mvn package


# Run the application using the jar file built by Maven
CMD ["java", "-jar", "target/url-shortener-0.0.1-SNAPSHOT.jar"]

