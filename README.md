# Sirius Storage Mainnet Community Onboarding

- [Basic Overview](#basic-overview)
- [Requirements](#os-requirements)
- [Getting Started](#getting-started)
- [How to run as SDN](#how-to-run-as-sdn)
- [How to run as SRN](#how-to-run-as-srn)
- [Helpdesk](#helpdesk)
- [References](#references)


## Basic Overview
This onboarding will help users to operate as Sirius Storage Director Node and/or Sirius Storage Replicator Node.

[Storage Director Node (SDN)](https://storagedocs.xpxsirius.io/docs/roles/owner/) acts as a front facing staging storage server for temporary hosting of files and doubles up as a transiting point for files to be stored in Replicators.  

A [Storage Replicator Node (SRN)](https://storagedocs.xpxsirius.io/docs/roles/replicator/) node has 2 roles:

1) replicator: store SDN data.
2) verifier: check the integrity of data stored and safe

To better understand how the Sirius Storage works, it will be worthwhile reading the [online sirius storage documentation](https://storagedocs.xpxsirius.io/)

## Initial Preparation

The SDN and SRN requires a private key with XPX from the ProximaX Sirius Chain Mainnet to participate in the Sirius Storage Network.  Therefore, we recommend users to create a new account and transfer XPX amount into this new account.  This can be done using [ProximaX Sirius Wallet](https://www.proximax.io/en/wallet).

## OS Requirements

Ensure that your local network allows inbound/outbound traffic on these ports:

### SDN Inbound Ports
- 6366/tcp
- 63666/tcp

### SRN Inbound Ports
- 6466/tcp
- 64666/tcp


### System Requirements:
- x86 64-bit Linux installation
- 4GB system RAM

This README was prepared using the following platform(s):
- Ubuntu 18.04

## Getting Started

If you are interested to use Docker to operate your SDN / SRN, please check out the following sections and skip the next section: 
- [Sirius Storage Node Onboarding Guide using Docker-Compose Method](docs/docker-method.md)

The remaining sections will be a guide on how to setup and run SDN or SRN using binary files.

### Install wat2wasm

`wat2wasm` is required for Supercontracts to work.  Refer to the following section to install `wat2wasm` according to your platform

*Platform: `Ubuntu 18.04 (Bionic Beaver)`*

```bash
wget https://github.com/WebAssembly/wabt/releases/download/1.0.20/wabt-1.0.20-ubuntu.tar.gz
tar -xvf wabt-1.0.20-ubuntu.tar.gz -C /usr/local --strip-components 1
```

*Platform: `Ubuntu 20.04 (Focal Fossa)`*

```bash
sudo apt-get install wabt
```

For other platforms, you may refer to [this page](https://command-not-found.com/wat2wasm) for assistance.

## How to run as SDN

Download setup script:

```
curl -fsSL raw.githubusercontent.com/proximax-storage/sirius-storage-mainnet-onboarding/main/scripts/setup-director.sh -o setup-director.sh
```

Run the setup script:

```
sh setup-director.sh
```

*The setup script should have setup the SDN files in `~/.dfms-client/` and started the `dfms-client` systemd service*

Check status of SDN service:

```bash
systemctl status dfms-client.service
```

View SDN logs:

```bash
journalctl -u dfms-client.service
```

**SDN CLI**:

The `dfms-client` binary is installed in `/usr/local/bin`.  It should be available in the command line:

```
which dfms-client
dfms-client version
dfms-client net id
```

See [CLI](https://storagedocs.xpxsirius.io/docs/cli/dfms/dfms/) for `dfms-client` command-line references.

## How to run as SRN

Download setup script:

```
curl -fsSL raw.githubusercontent.com/proximax-storage/sirius-storage-mainnet-onboarding/main/scripts/setup-replicator.sh -o setup-replicator.sh
```

Run the setup script:

```
sh setup-replicator.sh
```

*The setup script should have setup the SRN files in `~/.dfms-replicator/` and started the `dfms-replicator` systemd service*

Check status of SRN service:

```bash
systemctl status dfms-replicator.service
```

View SRN logs:

```bash
journalctl -u dfms-replicator.service
```

**SRN CLI**

The `dfms-replicator` binary is installed in `/usr/local/bin`.  It should be available in the command line:

```
which dfms-replicator
dfms-replicator version
dfms-replicator net id
```

See [CLI](https://storagedocs.xpxsirius.io/docs/cli/dfms/dfms/) for `dfms-replicator` command-line references.

## Helpdesk
We have a [telegram helpdesk](https://t.me/proximaxhelpdesk) to assist general queries.

## References
- [Sirius Storage](https://storagedocs.xpxsirius.io/)

- [ProximaX Exchange Market](https://storagedocs.xpxsirius.io/docs/built_in_features/exchange/)
