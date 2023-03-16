# Use an official Ubuntu image as the base image
FROM node:alpine
LABEL maintainer="Musera <isaac.musera@student.moringaschool.com>"
# Install required packages and dependencies

 #install git
RUN apk add --no-cache git

# Clone the YOLO repository
RUN git clone https://github.com/MuseraIsaac/yolo.git

# Navigate to the YOLO root directory
WORKDIR /yolo

# Install the dependencies for the client
RUN cd client && npm install && npm start

# Install the dependencies for the backend
RUN cd /yolo/backend/ && npm install && npm start



# command to run when Docker container is launched
CMD ["npm", "start"]

#ENTRYPOINT ["node" "composeHelper.js" ]







