## 1. Choice of the base image on which to build each container.

    Security: The base image has a strong security track record and originates from a reputable source.
    
    Size: The container's size is minimized as much as possible to enhance its overall performance.
    
    Compatibility: The base image is compatible with the application's required software and dependencies.
    
    Support: The provider or community offers strong support and comprehensive documentation.
    
    Licensing: The images are appropriately licensed for their intended use.
    
    Familiarity: I opted for a base image that I was already familiar with.
    
    Performance: The base image's performance and its effect on the container's performance were taken into account.
    
    Maintenance: The maintenance requirements of the base image, including update frequency and level of support, were considered.
    
    Community: The size and level of activity of the community around the base image were taken into consideration.
    






# 2. Dockerfile directives used in the creation and running of each container.

    FROM node:alpine: This command sets the base image as the Node.js environment running on the lightweight Alpine Linux distribution.

    LABEL maintainer="Musera <isaac.musera@student.moringaschool.com>": This command adds metadata to the image, such as the maintainer's name and email.
    
    RUN apk add --no-cache git: This command installs Git, which is a version control system that is needed to clone a repository.
    
    RUN git clone https://github.com/MuseraIsaac/yolo.git: This command clones the YOLO repository from GitHub.
    
    WORKDIR /yolo: This command sets the working directory to the root of the cloned repository.
    
    RUN cd client && npm install && npm start: This command changes the directory to the client directory, installs the required packages and dependencies using npm, and then starts the client.
    
    RUN cd /yolo/backend/ && npm install && npm start: This command changes the directory to the backend directory, installs the required packages and dependencies using npm, and then starts the backend server.

    CMD ["npm", "start"]: 
    This line sets the default command to be run when a container is started from this image. 
    In this case, it runs the npm start command to start the Node.js application.


# 3. Docker-compose Networking (Application port allocation and a bridge network implementation) where necessary.
    In the application, every container has its own ports that can be accessed by mapping them to corresponding ports on the host machine through the "ports" configuration option in the docker-compose.yml file. 
    This setup enables inter-container communication via the yolo_network, as well as external access to the services offered by the containers. All communication between containers occurs within the yolo_yolo custom network.

# 4. Docker-compose volume definition and usage (where necessary).
     With Docker Compose, it is possible to define and oversee volumes for containers in a multi-container Docker application. 
     Volumes serve as a means of persisting data even after container restarts, and enable the sharing of data among containers.

# 5. Git workflow used to achieve the task.
    -Set up a Git repository for the web application and clone it to your local machine.
    -Create a Dockerfile for the web application and a .dockerignore file to omit irrelevant files and directories.
    -Craft a deployment script that leverages the docker-compose command to deploy the Dockerized web application on the server.
    -Use the git push command to upload the changes to the Git repository.


# 7. Good practices such as Docker image tag naming standards for ease of identification of images and containers.
    -Choose descriptive names: Opt for names that convey meaning and describe the image and its purpose, rather than using generic or confusing names or abbreviations.

    -Include version information: Incorporating version information in the tag name makes it easier to identify the specific version of the image being used. It is advisable to use semantic versioning (major.minor.patch) to denote the changes made in each version.

    -Use lowercase: Ensure that tag names are entirely lowercase to avoid any issues with case sensitivity when running Docker commands.

    -Use dashes to separate words: Separate words in tag names by using dashes, rather than underscores or camelCase.

    -Avoid special characters: Refrain from using special characters like underscores, spaces, or colons in tag names.

    -Exercise caution with the latest tag: Avoid using the latest tag for images, unless absolutely necessary.