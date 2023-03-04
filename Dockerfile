# Use an official Ubuntu image as the base image
FROM ubuntu:latest
LABEL maintainer="Musera <isaac.musera@student.moringaschool.com>"
# Install required packages and dependencies
RUN apt-get update && \
    apt-get install -y git build-essential cmake libopencv-dev nodejs npm mongodb

# Clone the YOLO repository
RUN git clone https://github.com/MuseraIsaac/yolo.git

# Navigate to the YOLO root directory
WORKDIR /yolo
# Copy the package.json and package-lock.json files to the working directory
COPY client/package*.json ./
# Install Node.js dependencies
RUN npm install
COPY package.json package.json
# Build the YOLO application
RUN make

# Copy the binary and configuration files to the Docker image
COPY ./cfg/ ./cfg/
COPY ./data/ ./data/
COPY ./build/darknet/x64/darknet ./darknet

# Set the command to be run when the Docker container is launched
CMD ["npm", "start"]

#ENTRYPOINT ["node" "composeHelper.js" ]







