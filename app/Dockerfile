FROM python:3.11

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*



# Install Python dependencies
RUN pip install --no-cache-dir flask mysql-connector-python

# Copy project files
COPY src/ .

# Expose the application port
EXPOSE 5000

# Run the app
CMD ["python", "main.py"]
