FROM mcr.microsoft.com/mssql/server:2017-latest

LABEL version="1.0.1"
LABEL maintainer="steve@digitalmine.com"
LABEL gitrepo="https://github.com/digitalminellc/docker-mssql"
LABEL dockerrepo="https://hub.docker.com/r/digitalmine/docker-mssql"

# Create a config directory
RUN mkdir -p /usr/config
WORKDIR /usr/config

# Copy config directory to container
COPY ./config /usr/config

# Grant permissions for to our scripts to be executable
RUN chmod -R +x /usr/config

# Expose Default SQL Server TCP/Port
EXPOSE 1433

ENTRYPOINT ["./entrypoint.sh"]
