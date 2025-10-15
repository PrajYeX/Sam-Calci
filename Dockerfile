# Dockerfile
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy only necessary files
COPY app/ app/
COPY tests/ tests/
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Default command (optional)
CMD ["pytest", "tests"]
