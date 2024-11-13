#FROM - Image to start building on.
FROM ubuntu:14.04

#MAINTAINER - Identifies the maintainer of the dockerfile.
MAINTAINER Rajesh

#RUN - Runs a command in the container
RUN apt-get update && apt-get install -y python

# Copy the HTML file to the container
COPY index.html /var/www/html/index.html

#EXPOSE - Expose the port number
EXPOSE 80

#CMD - Identifies the command that should be used by default when running the image as a container.
CMD ["python", "-m", "http.server", "80", "--directory", "/var/www/html"]
