# Use an official Python runtime as a parent image
FROM python:3.7-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app/

# Install pipenv
RUN pip install --upgrade pip && \
    pip install pipenv

# Install dependencies from Pipfile
RUN pipenv install --system --deploy --ignore-pipfile

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run app.py when the container launches
CMD ["flask", "run"]
