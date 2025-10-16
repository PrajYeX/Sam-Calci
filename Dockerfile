# Use official Python slim image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy application files
COPY app/ app/
COPY tests/ tests/
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install curl and unzip (needed for SAM CLI)
RUN apt-get update && apt-get install -y \
    curl unzip git && \
    rm -rf /var/lib/apt/lists/*

# Install AWS SAM CLI
RUN curl -Lo sam-installation.sh https://raw.githubusercontent.com/aws/aws-sam-cli/main/packaging/docker/installers/install.sh && \
    chmod +x sam-installation.sh && \
    ./sam-installation.sh && \
    rm sam-installation.sh

# Verify SAM installation
RUN sam --version

# Set environment variable (optional)
ENV PYTHONPATH=/app

# Default command
CMD ["bash"]
