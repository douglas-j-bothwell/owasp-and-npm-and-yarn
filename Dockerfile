FROM harness/owasp-dependency-check-job-runner:latest as scanner

RUN apt-get update && apt-get install -y \
  ca-certificates \
  curl

# install npm
ARG NODE_VERSION=14.16.0
ARG NODE_PACKAGE=node-v$NODE_VERSION-linux-x64
ARG NODE_HOME=/opt/$NODE_PACKAGE

ENV NODE_PATH $NODE_HOME/lib/node_modules
ENV PATH $NODE_HOME/bin:$PATH

RUN curl https://nodejs.org/dist/v$NODE_VERSION/$NODE_PACKAGE.tar.gz | tar -xzC /opt/

# comes with npm
RUN npm install -g typescript


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
