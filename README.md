# Samba Server Configuration in Docker Microservices Context

This repository contains a project that aims to install and configure a Samba file/print server in a Docker microservices context. 

## Requirements

To run this project, the following requirements are needed:

- Docker
- Docker Compose

## Configuration

This project uses Docker Compose to orchestrate the Samba containers. The `docker-compose.yml` file contains the necessary configuration to create the containers.

### Users

Three users have been created:

- `admin`: With access to the private folder.
- `user1`: With access to the usr1 folder.
- `user2`: With access to the usr2 folder.

### Shares (Folders)

Four shared folders have been created:

1. Private folder (Access restricted to the `admin``).
2. Public folder (Access for all users).
3. usr1 folder (Access only for `user1`).
4. usr2 folder (Access only for `user2`).

### Docker Volumes

The shared folders are reflected in Docker volumes:

- `private`: For the private folder.
- `public`: For the public folder.
- `usr1`: For the usr1 folder.
- `usr2`: For the usr2 folder.

### Backup Script

A backup script has been created that compresses the contents of the folders while maintaining the structure and saves it to a file with the following format: `Backup_dd_mm_yy.zip`, where `dd` is the day, `mm` is the month, and `yy` is the year.

## Usage Instructions

1. Clone this repository to your local machine.
2. Ensure that Docker and Docker Compose are installed.
3. Customize the Dockerfile if desired.
4. Run `docker-compose up -d` to start the containers.
5. Access the Samba server using the credentials of the created users.
6. Use the backup script as needed.