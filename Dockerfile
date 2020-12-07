FROM mcr.microsoft.com/mssql/server:2017-latest

LABEL Maintainer "Steve Withington"
LABEL GitRepo: "https://github.com/digitalminellc/docker-mssql"

# Expose Default SQL Server TCP/Port
EXPOSE 1433

# Create a config directory
RUN mkdir -p /usr/config
WORKDIR /usr/config

# Bundle config source
COPY . /usr/config

# Grant permissions for to our scripts to be executable
RUN chmod +x /usr/config/entrypoint.sh
RUN chmod +x /usr/config/configure-db.sh

ENTRYPOINT ["./entrypoint.sh"]
