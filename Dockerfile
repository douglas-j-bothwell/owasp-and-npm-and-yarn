FROM harness/sonarqube-agent-job-runner:latest as scanner

RUN apt-get update && apt-get install -y \
  ca-certificates \
  curl 

RUN curl https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -o packages-microsoft-prod.deb && \
  dpkg -i packages-microsoft-prod.deb && \ 
  rm packages-microsoft-prod.deb 

RUN apt-get update && apt-get install -y \
  dotnet-sdk-8.0

RUN dotnet tool install --global dotnet-sonarscanner

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

