FROM harness/owasp-dependency-check-job-runner:latest as scanner

RUN apt-get update && apt-get install -y \
  ca-certificates \
  curl

# install yarn
# https://linuxize.com/post/how-to-install-yarn-on-ubuntu-20-04/

RUN curl -o- -L https://yarnpkg.com/install.sh | bash
RUN sudo apt install yarn
ENV PATH="/root/.yarn/bin:$PATH"

# install pnpm
# https://vsys.host/how-to/how-to-install-pnpm-on-ubuntu-22-04
# https://github.com/pnpm/pnpm/issues/5103
RUN curl -fsSL https://get.pnpm.io/install.sh | sh -
RUN sudo npm install -g pnpm
ENV ENV PATH="~/.local/share/pnpm"
