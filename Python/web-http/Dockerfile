#Use the official lightweight Python image.
FROM --platform=linux/amd64 python:3.9-slim


# Set the working directory to /app
WORKDIR /app

#Copy requirements.txt to the working directory
COPY requirements.txt requirements.txt
# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Make port 8000 available to the world outside this container
EXPOSE 8000

#Run app.py when the container launches
CMD ["python", "app.py"]
