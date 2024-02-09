# STEP 1 
# Specify the STO scanner image where you want to add your certificates
# For a list of all images in the Harness Container Registry, run the following:
#     curl -X  GET https://app.harness.io/registry/_catalog

FROM harness/owasp-dependency-check-job-runner:latest as scanner

RUN apt-get update && apt-get install -y \
  ca-certificates \
  curl


# STEP 2
# Add the packages and files you need to the image

# install sudo
RUN apt install sudo

# install npm
# https://askubuntu.com/questions/720784/how-to-install-latest-node-inside-a-docker-container
RUN apt update
RUN printf 'y\n1\n\1n' | apt install nodejs
RUN apt install -y npm

# make sure Node is up-to-date
# https://askubuntu.com/questions/426750/how-can-i-update-my-nodejs-to-the-latest-version
RUN sudo npm cache clean -f
RUN sudo npm install -y -g n
RUN sudo n stable


# install yarn
# https://linuxize.com/post/how-to-install-yarn-on-ubuntu-20-04/
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
RUN sudo apt install yarn -y
ENV PATH="/root/.yarn/bin:$PATH"

# install pnpm
# https://vsys.host/how-to/how-to-install-pnpm-on-ubuntu-22-04
# https://github.com/pnpm/pnpm/issues/5103
RUN SHELL="bash:$SHELL"
RUN wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -
RUN npm install -g pnpm
ENV PATH="~/.local/share/pnpm:$PATH"
