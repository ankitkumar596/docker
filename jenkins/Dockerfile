FROM debian:12-slim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        fontconfig \
        wget \
        gnupg \
    && rm -rf /var/lib/apt/lists/*

# Install OpenJDK 17
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        fontconfig openjdk-17-jre \
    && rm -rf /var/lib/apt/lists/*

# Download and add Jenkins repository key
RUN wget -q -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian/jenkins.io-2023.key && \
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ |  tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        jenkins \
    && rm -rf /var/lib/apt/lists/*

# Expose Jenkins port
EXPOSE 8080

# Set the default command to run Jenkins
CMD ["java", "-jar", "/usr/share/java/jenkins.war"]

