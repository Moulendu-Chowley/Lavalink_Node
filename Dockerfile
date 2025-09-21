# Use Eclipse Temurin OpenJDK 17 (more reliable than openjdk)
FROM eclipse-temurin:17-jre-jammy

# Set the working directory inside the container
WORKDIR /opt/Lavalink

# Install curl for health checks (optional but useful)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copy the Lavalink jar file
COPY Lavalink.jar Lavalink.jar

# Copy the application.yml configuration file
COPY application.yml application.yml

# Create plugins directory and copy plugins if they exist
COPY plugins/ plugins/

# Create logs directory for Lavalink logs
RUN mkdir -p logs

# Expose port 2333 (Railway will map this to their PORT)
EXPOSE 2333

# Set JVM options for better performance and Railway compatibility
ENV JAVA_OPTS="-Xmx512m -Xms256m -Djava.awt.headless=true"

# Run Lavalink
CMD java $JAVA_OPTS -jar Lavalink.jar