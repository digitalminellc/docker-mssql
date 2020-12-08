# MSSQL for Docker

## Get Up & Running

[Docker Desktop](https://www.docker.com/products/docker-desktop) must installed and running on your computer (*Desktop Community* edition is perfectly fine) prior to following the steps below.

## After Docker Desktop Has Been Installed

Follow the steps outlined below to get the container up and running.

1. Clone [this repo](https://github.com/digitalminellc/docker-mssql.git) to your desktop
2. Launch your shell program and `cd` into the cloned directory
3. Modify the `setup.sql` file with your custom TSQL
4. Select one of the following options below

### Option 1: Use the `docker-compose.yml` File

1. Launch your shell program and `cd` into the cloned directory
2. Run the following command:

  ```bash
  docker-compose up
  ```

Docker will then begin to do its thing.

### Option 2: Build Your Own Image

1. Launch your shell program and `cd` into the cloned directory
2. Modify the `Dockerfile` as you desire
3. Run the following command:

  ```bash
  docker build -t my-custom-mssql .
  ```

4. Start a new container using `docker run`

  ```bash
  docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=5trongP@55w0rd' -p 5533:1433 --name sql1 -d my-custom-mssql
  ```

Note: MSSQL passwords must be at least 8 characters long, contain upper case, lower case and digits.

## Stopping The Container

To stop the container, follow these steps:

1. Open the shell window where the program is running
2. On maxOS, use `<control>+C`
3. On Windows, use `<⌘>+C`

OR

1. Launch your shell program and `cd` into the cloned directory
2. Run the following command:

  ```bash
  docker-compose down
  ```

## Issues

Please submit issues to <https://github.com/digitalminellc/docker-mssql/issues>

## License

[MIT](LICENSE)
