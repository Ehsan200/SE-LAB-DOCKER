# Use the official Python image from the Docker Hub
FROM python:3.11.4-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1  # Prevents Python from writing pyc files to disc
ENV PYTHONUNBUFFERED 1  # Prevents Python from buffering stdout and stderr

# Set the working directory
WORKDIR /app

# install system dependencies
RUN apt-get update && apt-get install -y netcat

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# copy entrypoint.sh
COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Copy the project
COPY . /app/

# Expose the port that the app runs on
EXPOSE 8000

# run entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
