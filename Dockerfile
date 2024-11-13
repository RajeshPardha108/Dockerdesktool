#FROM - Image to start building on.
FROM ubuntu:14.04

#MAINTAINER - Identifies the maintainer of the dockerfile.
MAINTAINER ian.miell@gmail.com

#RUN - Runs a command in the container
RUN apt-get update && apt-get install -y python

# Copy the HTML file to the container
COPY index.html /var/www/html/index.html

# Create a script to keep the container running
RUN echo '#!/bin/bash\nwhile true; do sleep 1000; done' > /keep_alive.sh && chmod +x /keep_alive.sh

#EXPOSE - Expose the port number
EXPOSE 80

#CMD - Identifies the command that should be used by default when running the image as a container.
CMD ["bash", "/keep_alive.sh"]
