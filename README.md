# Sirius Storage Mainnet Community Onboarding

- [Basic Overview](#basic-overview)
- [Requirements](#os-requirements)
- [Installation](#installation)

## Basic Overview
This onboarding will help users to operate as Sirius Storage Director Node and/or Sirius Storage Replicator Node.

[Storage Director Node (SDN)](https://storagedocs.xpxsirius.io/docs/roles/owner/) acts as a front facing staging storage server for temporary hosting of files and doubles up as a transiting point for files to be stored in Replicators.  

A [Storage Replicator Node (SRN)](https://storagedocs.xpxsirius.io/docs/roles/replicator/) node has 2 roles:

1) replicator: store SDN data.
2) verifier: check the integrity of data stored and safe

To better understand how the Sirius Storage works, it will be worthwhile reading the [online sirius storage documentation](https://storagedocs.xpxsirius.io/) 


## OS Requirements

Ensure that your local network allows inbound/outbound traffic on these ports:
- 3000/tcp
- 6466/tcp
- 64666/tcp
- 6366/tcp
- 63666/tcp

System Requirements:
- x86 64-bit Linux installation
- 4GB system RAM

This README was prepared using the following platform(s):
- Ubuntu 18.04


## Getting Started

| | |
| --- | --- |
| [Docker](docs/docker-method.md) | Set up SDN or SRN using docker |
| Binary | Set up SDN or SRN by installing static binary |


## Helpdesk
We have a [telegram helpdesk](https://t.me/proximaxhelpdesk) to assist general queries.

## References
- [Sirius Storage](https://storagedocs.xpxsirius.io/)

- [ProximaX Exchange Market](https://storagedocs.xpxsirius.io/docs/built_in_features/exchange/)
