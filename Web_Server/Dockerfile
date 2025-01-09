# Use an official Python runtime as a parent image
FROM python:3.8

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install required tools for SSH
RUN apt-get update && apt-get install -y openssh-client sshpass openssh-server curl bash

# Create and set the working directory in the container
WORKDIR /Web_Server

# Copy the requirements file into the container at /Web_Server
COPY requirements.txt /Web_Server/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the current directory contents into the container at /Web_Server
COPY . /Web_Server/

# Expose the port the Web_Serverlication will run on
EXPOSE 8000

# Run Django's development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
