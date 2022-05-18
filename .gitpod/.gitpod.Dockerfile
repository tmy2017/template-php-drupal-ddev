FROM gitpod/workspace-full
SHELL ["/bin/bash", "-c"]

RUN sudo apt-get -qq update
# Install required libraries for Projector + PhpStorm
RUN sudo apt-get -qq install -y python3 python3-pip libxext6 libxrender1 libxtst6 libfreetype6 libxi6
# Install Projector
RUN pip3 install projector-installer
# Install PhpStorm
RUN mkdir -p ~/.projector/configs  # Prevents projector install from asking for the license acceptance
RUN projector install 'PhpStorm 2022.1.1' --no-auto-run

# Install ddev
# it works - just update this file with nominal change - then the brew update is really executed! 
#    so the official https://gitpod.io/#github.com/gitpod-io/template-php-drupal-ddev's docker image
#    built by this dockerfile is (maybe) cached - hence that "brew update" was not working - you must update this 
#    dockerfile to "kick off" another rebuild of docker image! 
RUN brew update && brew install drud/ddev/ddev && mkcert -install
###
### Initiate a rebuild of Gitpod's image by updating this comment #1
####