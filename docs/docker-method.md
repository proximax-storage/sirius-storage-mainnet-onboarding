# Sirius Storage Node Onboarding Guide using Docker-Compose Method

This guide has the following sections:
- [Pre-requisites](#pre-requisites)
- [Download the onboarding files](#download-the-onboarding-files)
- [How to run as SDN](#how-to-run-as-sdn)
- [How to run as SRN](#how-to-run-as-srn)
- [Note](#note)
## Pre-requisite

This onboarding method requires `docker` and `docker-compose`.  Please see [Supported platforms](https://docs.docker.com/engine/install/#server) whether your linux platform is supported by docker.

Run the following command to install `docker`:

```
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sh get-docker.sh
```

As per docker post-installation note, we recommend using Docker as a non-root user.  Therefore, you should now consider adding your user to the "docker" group with something like:

```
$ sudo usermod -aG docker $your_user
```

Remember that you will have to log out and back in for this to take effect!"

Installation instructions for docker-compose can be found [here](https://docs.docker.com/compose/install/). 

Enable and start Docker:
```
$ sudo systemctl enable docker.service
$ sudo systemctl start docker.service
$ sudo systemctl status docker.service
```

Git needs to be installed.

```
$ sudo apt install git
```

## Download the onboarding files:

```
git clone https://github.com/proximax-storage/sirius-storage-mainnet-onboarding.git

# change into the git cloned directory
cd  sirius-storage-mainnet-onboarding
```

## How to run as SDN

### Add your private key:

Run the following commands and replace `<PRIVATE_KEY>` with [SDN account](../README.md#initial-preparation)'s private key.

```bash
chmod +x tools/pk2ks-util
mkdir director/keystore
tools/pk2ks-util -dir director/keystore -key <PRIVATE_KEY>
# Example: if your private key is 69b24c083026fed041e0db68ee5a471fb8656575b317db632c12b82be1fbea7c
# tools/pk2ks-util -dir ../director/keystore -key 69b24c083026fed041e0db68ee5a471fb8656575b317db632c12b82be1fbea7c
```

### Start SDN

```bash
cd director
docker-compose up -d
```

### Check if SDN is running

`docker-compose ps`

### Stop SDN

`docker-compose down`

### Restart the SDN

`docker-compose restart`

### Check logs

`docker-compose logs`

### SDN CLI

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
```

## How to run as SRN

### Add your private key:

Run the following commands and replace `<PRIVATE_KEY>` with [SRN account](../README.md#initial-preparation)'s private key.

```bash
chmod +x tools/pk2ks-util
mkdir replicator/keystore
tools/pk2ks-util -dir replicator/keystore -key <PRIVATE_KEY>
# Example: if your private key is 69b24c083026fed041e0db68ee5a471fb8656575b317db632c12b82be1fbea7c
# tools/pk2ks-util -dir ../replicator/keystore -key 69b24c083026fed041e0db68ee5a471fb8656575b317db632c12b82be1fbea7c
```

### Start SDN

```bash
cd replicator
docker-compose up -d
```

### Check if SDN is running

`docker-compose ps`

### Stop SDN

`docker-compose down`

### Restart the SDN

`docker-compose restart`

### Check logs

`docker-compose logs`

### SRN CLI

To use the dfms-replicator command line, you can create alias:

```
alias dfms-replicator="docker-compose -f DOCKER_COMPOSE_PATH exec replicator dfms-replicator"
# e.g. if docker-compose.yml is located in /home/user/sirius-storage-mainnet-onboarding/replicator/docker-compose.yml then
# alias dfms-client="docker-compose -f /home/user/sirius-storage-mainnet-onboarding/replicator/docker-compose.yml exec replicator dfms-replicator"

# test alias
dfms-replicator version
dfms-replicator net id
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
alias dfms-replicator="docker-compose -f DOCKER_COMPOSE_PATH exec replicator dfms-replicator"
```

---
## **NOTE**

The alias command can only be run when the docker-compose are running.

---

See [CLI](https://storagedocs.xpxsirius.io/docs/cli/dfms/dfms/) for `dfms-replicator` and `dfms-client` command-line references.
