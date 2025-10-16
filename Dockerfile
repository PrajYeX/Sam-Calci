# Use Docker CLI image as base (for Docker-in-Docker)
FROM docker:24.0.2-cli

# Install Python3, pip, bash, git, curl
RUN apk add --no-cache python3 py3-pip bash git curl

# Install AWS CLI (optional but recommended)
RUN pip3 install awscli

# Install AWS SAM CLI
RUN pip3 install aws-sam-cli

# Set working directory inside container
WORKDIR /app

# Copy project files
COPY app/ app/
COPY tests/ tests/
COPY requirements.txt .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Mount Docker socket to allow building images inside container
VOLUME ["/var/run/docker.sock"]

# Default shell
CMD ["sh"]
