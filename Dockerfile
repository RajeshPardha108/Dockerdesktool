#FROM - Image to start building on.
FROM ubuntu:14.04

#MAINTAINER - Identifies the maintainer of the dockerfile.
MAINTAINERRajesh

#RUN - Runs a command in the container
RUN apt-get update && apt-get install -y python

# Copy the HTML file to the container
COPY index.html /var/www/html/index.html

# Create a script to keep the container running
RUN echo '#!/bin/bash\npython -m http.server 80 --directory /var/www/html' > /start_server.sh && chmod +x /start_server.sh

#EXPOSE - Expose the port number
EXPOSE 80

#CMD - Identifies the command that should be used by default when running the image as a container.
CMD ["bash", "/start_server.sh"]
