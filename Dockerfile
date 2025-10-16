# Use Python 3.12 slim as base
FROM python:3.12-slim

# Install bash, git, curl, Docker CLI
RUN apt-get update && \
    apt-get install -y bash git curl docker.io && \
    rm -rf /var/lib/apt/lists/*

# Install AWS SAM CLI
RUN pip install aws-sam-cli

# Install project dependencies
RUN pip install pytest boto3

# Set working directory
WORKDIR /app

# Copy project files
COPY app/ app/
COPY tests/ tests/
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Docker socket to allow building images inside container
VOLUME ["/var/run/docker.sock"]

# Default shell
CMD ["sh"]
