# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project
COPY . /app/

# Expose the port that the app runs on
EXPOSE 8000

# Run migrations and the application
CMD ["sh", "-c", "python manage.py migrate"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
