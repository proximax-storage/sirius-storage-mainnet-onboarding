# How to run as SDN using Docker-Compose

## Add your private key:

Run the following commands and replace `<PRIVATE_KEY>` with [SDN account](../README.md#initial-preparation)'s private key.

```bash
chmod +x tools/pk2ks-util
tools/pk2ks-util -dir director/keystore -key <PRIVATE_KEY>
# Example: if your private key is 69b24c083026fed041e0db68ee5a471fb8656575b317db632c12b82be1fbea7c
# ./pk2ks-util -dir ../director/keystore -key 69b24c083026fed041e0db68ee5a471fb8656575b317db632c12b82be1fbea7c
```

## Start SDN

```bash
cd director
docker-compose up -d
```

## Check if SDN is running

`docker-compose ps`

## Stop SDN

`docker-compose down`

## Restart the SDN

`docker-compose restart`

## Check logs

`docker-compose logs`

## SDN CLI

To use the dfms-client command line, you can create alias:

```
alias dfms-client="docker-compose -f DOCKER_COMPOSE_PATH exec director dfms-client"
# e.g. if docker-compose.yml is located in /home/user/sirius-storage-mainnet-onboarding/director/docker-compose.yml then
# alias dfms-client="docker-compose -f /home/user/sirius-storage-mainnet-onboarding/director/docker-compose.yml exec director dfms-client"

# test alias
dfms-client version
dfms-client net id
```

To make the alias persistent you need to declare it in the ~/.bash_profile or ~/.bashrc file. Open the ~/.bashrc in your text editor:

```
nano ~/.bashrc
```

and add your aliases:

```
# ~/.bashrc
# Aliases
# alias alias_name="command_to_run"

# Long format list
alias dfms-client="docker-compose -f DOCKER_COMPOSE_PATH exec director dfms-client"
alias dfms-replicator="docker-compose -f DOCKER_COMPOSE_PATH exec replicator dfms-replicator"
```
