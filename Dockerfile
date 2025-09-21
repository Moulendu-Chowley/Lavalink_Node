# Use OpenJDK 17 as the base image (Railway supports Java)
FROM openjdk:17-jre-slim

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

# Expose the port that Lavalink will run on
# Railway will set the PORT environment variable
EXPOSE ${PORT:-2333}

# Set JVM options for better performance and Railway compatibility
ENV JAVA_OPTS="-Xmx512m -Xms256m -Djava.awt.headless=true"

# Health check (optional - Railway can use this for monitoring)
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:${PORT:-2333}/version || exit 1

# Run Lavalink
CMD java $JAVA_OPTS -jar Lavalink.jar