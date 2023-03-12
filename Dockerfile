# Use an official Ubuntu image as the base image
FROM node:alpine
LABEL maintainer="Musera <isaac.musera@student.moringaschool.com>"
# Install required packages and dependencies
#RUN apt-get update && \
   # apt-get install -y git build-essential cmake libopencv-dev nodejs npm mongodb

 #install git
RUN apk add --no-cache git

# Clone the YOLO repository
RUN git clone https://github.com/MuseraIsaac/yolo.git

# Navigate to the YOLO root directory
WORKDIR /yolo

# Install the dependencies for the client
RUN cd client && npm install && npm start
RUN ls
# Install the dependencies for the backend
RUN cd /yolo/backend/ && npm install && npm start


# Install Node.js dependencies
#RUN npm install
#COPY package.json package.json
# Build the YOLO application
#RUN make

# Copy the binary and configuration files to the Docker image
#COPY ./cfg/ ./cfg/
#COPY ./data/ ./data/
#COPY ./build/darknet/x64/darknet ./darknet

# command to run when Docker container is launched
CMD ["npm", "start"]

#ENTRYPOINT ["node" "composeHelper.js" ]







