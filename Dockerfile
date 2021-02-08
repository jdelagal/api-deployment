#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*


# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts
ADD apictl /root

# Install Node
RUN \
  curl -sL https://deb.nodesource.com/setup_15.x| sudo -E bash - && \
  sudo apt-get install -y nodejs

RUN npm install -g @stoplight/spectral
RUN npm install -g @stoplight/prism-cli
RUN npm install -g newman

RUN chmod +x /root/script.sh

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

#ENTRYPOINT ["apic", "yes", "no"]


# Define default command.
CMD ["bash"]