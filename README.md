# Golang Image Builder

JBC Labs Composer generic image builder for Golang. This is the default build configuration for Golang images and is used by the JBC Labs Composer Component Builder service

Default build workflow:

1. Component builder starts with a task to create a golang image and then dynamically retrieves this repository.
2. Component builder updates the FROM image based on the component configuration to pull the proper version of the golang image.
3. Component builder retrieves and prepares the specified code artifact.
4. Component builder executes a Docker Build to generate an image
    - Pulls the proper official Golang image as the base image layer
    - Copies the build.sh and entrypoint.sh into the image
    - Copies the code artifact into the image
    - Executes the build.sh script to prepare the image to run
5. Component builder pushes the generated image to a designated container repository

# How to customize python component setup
Clone this repository to modify and then update the build artifact in your application component configuration within JBC Labs to use your own customized builder.
- Simplest option is to modify the build.sh and entrypoint.sh scripts to prepare and customize the image.
  - build.sh runs once during the docker build process. It can be used to install software packages into image.
  - entrypoint.sh runs every time that image starts and can be utilized to prepare run time environmet like exporting environment variables, setting the PATH etc.
  
- Alternatively you can also modify the Dockerfile and use Docker syntax to build your own customized image. If you create your own Dockerfile you will also need to update the image artifact in JBC Labs Composer as component builder will override the FROM line in the Dockerfile with the image specified in the config.
