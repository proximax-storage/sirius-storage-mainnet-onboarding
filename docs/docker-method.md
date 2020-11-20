# Setup using Docker

## Pre-requisite

This onboarding method requires `docker`.  Please see [Supported platforms](https://docs.docker.com/engine/install/#server) whether your linux platform is supported by docker.

Run the following command to install `docker`:

```
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sh get-docker.sh
```

Git needs to be installed.

```
$ sudo apt install git
```

## How to download Sirius Storage:

```
git clone https://github.com/proximax-storage/sirius-storage-mainnet-onboarding.git
```

## How to run as SDN

Change directory:

```
cd sirius-storage-mainnet-onboarding/director
```

Getting started instructions can be found [here](../director/README.md).

## How to run as SRN

### Change directory:
```
cd sirius-storage-mainnet-onboarding/replicator
```

### Add private key:

Edit `start-replicator.sh` and replace `<PRIVATE_KEY>` with SRN account's private key.

```
#!/bin/bash

replicator_key='<PRIVATE_KEY>'

docker stop replicator
docker rm replicator
docker run -d --name replicator --network host -v $PWD:/root/.dfms-replicator:rw proximax/dfms-replicator:v0.8.0 dfms-replicator -k $replicator_key
docker exec replicator dfms-replicator contract accepting
```

### Start SRN

```
./start-replicator.sh
```

### Stop SRN

```
./stop-replicator.sh
```

## How to execute command

The docker image contains the `dfms-replicator` and `dfms-client` command. 

You will be able to access the `dfms-replicator` command via docker using the following:
`docker exec replicator dfms-replicator`

and you will be able to access the `dfms-client` command via docker using the following:
`docker exec drive dfms-client`

Instead of typing a long command on the command line, you can create a shortcut by creating bash aliases:

```
alias dfms-replicator="docker exec replicator dfms"
alias dfms-client="docker exec drive dfms"
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
alias dfms-replicator="docker exec replicator dfms-replicator"
alias dfms-client="docker exec drive dfms-client"
```

You should name your aliases in a way that is easy to remember. It is also recommended to add a comment for future reference.

---
**NOTE**

The alias command can only be run when the `director` and/or `replicator` are running.

---

See [CLI](https://storagedocs.xpxsirius.io/docs/cli/dfms/dfms/) for `dfms-replicator` and `dfms-client` command-line references.
