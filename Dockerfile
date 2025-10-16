# Use Docker CLI image as base
FROM docker:24.0.2-cli

# Install Python3, pip, bash, git, curl
RUN apk add --no-cache python3 py3-pip bash git curl

# Install AWS SAM CLI
RUN pip3 install aws-sam-cli

# Install project dependencies (pytest, boto3)
RUN pip3 install pytest boto3

# Set working directory for Jenkins agent
WORKDIR /home/jenkins/agent

# Docker socket to allow building images inside container
VOLUME ["/var/run/docker.sock"]

# Default shell
CMD ["sh"]
