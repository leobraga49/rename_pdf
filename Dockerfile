# Use the desired Java base image with version 18.01
FROM openjdk:18-jdk-alpine3.14

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file and other necessary files to the container
COPY setup/change_pdf_name.jar .
COPY files/files.zip .
COPY files/db.csv .
COPY setup/zip.sh .

# Install the zip utility
RUN apk add --no-cache zip

# Extract the files.zip archive
RUN unzip files.zip -d /app
RUN chmod +x zip.sh