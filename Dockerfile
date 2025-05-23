# Use Python base image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV GRADIO_ALLOW_FLAGGING=never

# Set work directory
WORKDIR /app

# Copy all project files
COPY . /app/

# Install system dependencies (if any)
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the port Gradio will run on
EXPOSE 8080

# Run the Gradio app
CMD ["python", "app.py"]
