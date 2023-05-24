# Use the desired Java base image with version 18.01
FROM openjdk:18-jdk-alpine3.14

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file and other necessary files to the container
COPY setup/change_pdf_name.jar /app/change_pdf_name.jar
COPY setup/zip.sh /app/zip.sh
COPY files/files.zip /app/files.zip
COPY files/db.csv /app/db.csv

# Install the zip utility
RUN apk add --no-cache zip

# Extract the files.zip archive
RUN unzip files.zip -d /app/files
RUN chmod +x zip.sh