FROM harness/owasp-dependency-check-job-runner:latest as scanner

RUN apt-get update && apt-get install -y \
  ca-certificates \
  curl

# install npm
# https://linuxize.com/post/how-to-install-node-js-on-ubuntu-20-04/
RUN sudo apt install ca-certificates curl gnupg

RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

RUN NODE_MAJOR=20
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

RUN sudo apt update
RUN sudo apt install nodejs
RUN sudo apt install build-essential

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash


# install yarn
# https://linuxize.com/post/how-to-install-yarn-on-ubuntu-20-04/

RUN curl -o- -L https://yarnpkg.com/install.sh | bash
RUN sudo apt install yarn
ENV PATH="/root/.yarn/bin:$PATH"

# install pnpm
# https://vsys.host/how-to/how-to-install-pnpm-on-ubuntu-22-04
# https://github.com/pnpm/pnpm/issues/5103
RUN curl -fsSL https://get.pnpm.io/install.sh | sh -
RUN npm install -g pnpm
# ENV PATH="~/.local/share/pnpm:$PATH"
