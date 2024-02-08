FROM harness/owasp-dependency-check-job-runner:latest as scanner

RUN apt-get update && apt-get install -y \
  ca-certificates \
  curl

# install sudo
RUN apt install sudo

# install npm
# https://askubuntu.com/questions/720784/how-to-install-latest-node-inside-a-docker-container
RUN apt update
# We directly answer the questions asked using the printf statement
RUN printf 'y\n1\n\1n' | apt install nodejs
RUN apt install -y npm

# install npm
# https://linuxize.com/post/how-to-install-node-js-on-ubuntu-20-04/
# RUN sudo apt install ca-certificates curl gnupg -y

# RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# RUN NODE_MAJOR=20
# RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# RUN sudo apt update
# RUN sudo apt install nodejs -y
# RUN sudo apt install build-essential -y

# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# RUN export NVM_DIR="$HOME/.nvm" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" -s "$NVM_DIR/bash_completion" ] && \. 


# install yarn
# https://linuxize.com/post/how-to-install-yarn-on-ubuntu-20-04/

RUN curl -o- -L https://yarnpkg.com/install.sh | bash
RUN sudo apt install yarn -y
ENV PATH="/root/.yarn/bin:$PATH"

# install pnpm
# https://vsys.host/how-to/how-to-install-pnpm-on-ubuntu-22-04
# https://github.com/pnpm/pnpm/issues/5103
RUN curl -fsSL https://get.pnpm.io/install.sh | sh -
RUN npm install -g pnpm
# ENV PATH="~/.local/share/pnpm:$PATH"
