# https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-docker-container-deployment
FROM mcr.microsoft.com/mssql/server:2017-latest

# LABEL version="1.1.6"
# LABEL maintainer="steve@digitalmine.com"
# LABEL gitrepo="https://github.com/digitalminellc/docker-mssql"
# LABEL dockerrepo="https://hub.docker.com/r/digitalmine/docker-mssql"

# Create a `build` directory
RUN mkdir -p /usr/build
WORKDIR /usr/build

# Copy `build` directory to container
COPY ./build /usr/build

# Grant permissions for to our scripts to be executable
RUN chmod -R +x /usr/build

# Expose Default SQL Server TCP/Port
EXPOSE 1433

ENTRYPOINT ["./entrypoint.sh"]
