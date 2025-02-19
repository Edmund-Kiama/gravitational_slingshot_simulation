FROM python:3-slim

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
# RUN 
# Copy application files
COPY . .

# Run the application
CMD ["python", "main.py"]
