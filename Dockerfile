FROM mcr.microsoft.com/mssql/server:2017-latest

LABEL maintainer="steve@digitalmine.com"
LABEL gitrepo="https://github.com/digitalminellc/docker-mssql"

# Create a config directory
RUN mkdir -p /usr/config
WORKDIR /usr/config

# Bundle config source
COPY . /usr/config

# Expose Default SQL Server TCP/Port
EXPOSE 1433

# Grant permissions for to our scripts to be executable
RUN chmod +x /usr/config/entrypoint.sh
RUN chmod +x /usr/config/configure-db.sh

ENTRYPOINT ["./entrypoint.sh"]
