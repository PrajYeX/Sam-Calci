# Base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy app files and requirements
COPY app/ app/
COPY tests/ tests/
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install dependencies needed for SAM CLI
RUN apt-get update && apt-get install -y \
    unzip curl less groff git && \
    rm -rf /var/lib/apt/lists/*

# Install AWS SAM CLI
RUN curl -Lo sam.zip https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip && \
    unzip sam.zip -d /usr/local/bin/ && \
    rm sam.zip

# Verify SAM CLI installation
RUN sam --version

# Set environment variable (optional)
ENV PYTHONPATH=/app
