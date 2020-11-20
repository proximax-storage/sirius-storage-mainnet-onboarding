# How to run as SDN

## Generate a key pair for the node (Director Account):

```
./generate_address
```

Example:
```
$ ./generate_address
PrivateKey:     69b24c083026fed041e0db68ee5a471fb8656575b317db632c12b82be1fbea7c
PublicKey:      98e28034b56f29edd469f19cbf3362ce1a820435931ae483daabfc2369ee1053
Address:        VA4MDQ5TXIHORZZG4LZKKRUXTUEJD6P3CQS3BPLL
```

## Add private key:
Edit `start-drive.sh` and replace `<PRIVATE_KEY>` with director account's private key.  

```bash
#!/bin/bash

director_key='<PRIVATE_KEY>'

docker stop director
docker rm director
docker run -d --name director -p 6366:6366 -p 63666:63666 -v $PWD:/root/.dfms-client:rw proximax/dfms-client:v0.8.0 dfms-client -k $director_key

```

Example:
Using nano editor by running `nano start-drive.sh`

```bash
#!/bin/bash

$director_key = '69b24c083026fed041e0db68ee5a471fb8656575b317db632c12b82be1fbea7c'

docker stop director
docker rm director
docker run -d --name director -p 6366:6366 -p 63666:63666 -v $PWD:/root/.dfms-client:rw proximax/dfms-client:v0.8.0 dfms-client -k $director_key

```

## Start SDN

```
./start-director.sh
```

Verify that SDN is running by running:

```bash
# checking docker running process:
docker ps

CONTAINER ID        IMAGE                                  COMMAND                  CREATED             STATUS              PORTS                                              NAMES
0b83f2c4c363        proximax/dfms-client:v0.8.0   "dfms-client -k 69B24C0830…"   9 seconds ago       Up 7 seconds        0.0.0.0:6366->6366/tcp, 0.0.0.0:63666->63666/tcp   director

# checking drive container logs
docker logs director
...
Root successfully started on:
1: /ip4/127.0.0.1/tcp/63666/p2p/12D3L7AV75nfdamZJHAf7iXNhZ3ggZxkNpaeGuzu5smXdSMgthoY
2: /ip4/172.17.0.2/tcp/63666/p2p/12D3L7AV75nfdamZJHAf7iXNhZ3ggZxkNpaeGuzu5smXdSMgthoY
API server successfuly started on /ip4/0.0.0.0/tcp/6366
```

## Transfer XPX to the SDN Account

You may use web wallet at https://wallet.xpxsirius.io to transfer XPX from your existing XPX account

## Exchange market

Before creating a drive, the owner must ensure that there is sufficient balance in the drive account to pay for the space for at least 1 billing period (1 month / 172800 ).

The storage units `SO` mosaic ID in Sirius Chain Mainnet is `42f11df73d00296a`.  
The streaming units `SM` mosaic ID in Sirius Chain Mainnet is `7e332c41b04e4e05`

You can see the exchange offers in the blockchain with the following API:
```
# offers to sell SO units for XPX
https://arcturus.xpxsirius.io/exchange/sell/42f11df73d00296a

# offers to buy SO units for XPX
https://arcturus.xpxsirius.io/exchange/buy/42f11df73d00296a


# offers to sell SM units for XPX
https://arcturus.xpxsirius.io/exchange/sell/7e332c41b04e4e05

# offers to buy SM units for XPX
https://arcturus.xpxsirius.io/exchange/buy/7e332c41b04e4e05
```

Please see [Exchange Market](https://storagedocs.xpxsirius.io/docs/built_in_features/exchange/) for more information about ProximaX Exchange Market.

### Create Drive

In order to create a drive, the owner must first [compose a drive contract](https://storagedocs.xpxsirius.io/docs/cli/dfms/contract/#dfms-contract-compose).

When creating a drive contract, the SDN will search the exchange market for the lowest offer.

Example: create drive contract 100MB for 1 month

```bash
docker exec drive dfms-client contract compose 100 1
# it will take several minutes before a response
{
        "drive": "baegaajaiaqjcbfh7iec4q2hwd62eclc7x3qbs67wqxcuo5ycbizw7ubwrstjmpte",
        "owner": "0804122098e28034b56f29edd469f19cbf3362ce1a820435931ae483daabfc2369ee1053",
        "replicators": [
                "0804122061603b668fa165f6e088ebe87a6796669f494bd3c744c34f95526566f787bc69",
                "080412204d6bf5a5dcffbc2e7dfef067f17e711f036797f40e90c52022831764680c2414",
                "08041220882b77ba73cf7f0d2e972615324c61ca20b6c4cb91922a09a6c662eb4cf9377f"
        ],
        "root": "bafybeiczsscdsbs7ffqz55asqdf3smv6klcw3gofszvwlyarci47bgf354",
        "created": 949218,
        "duration": 518400,
        "space": 100,
        "replicas": 3,
        "minReplicators": 3,
        "percentApprovers": 66,
        "billingPrice": 300,
        "billingPeriod": 172800
}
```

Drive contract for the account can be found in the Sirius Chain.

Example:
`https://arcturus.xpxsirius.io/account/98e28034b56f29edd469f19cbf3362ce1a820435931ae483daabfc2369ee1053/drive`

Note: `98e28034b56f29edd469f19cbf3362ce1a820435931ae483daabfc2369ee1053` is the public key of the SDN account

### Add file

The owner can add/upload file to the drive.  Since the `dfms-client` application is running inside a docker container, it will only be able to see files that are mounted in the present working directory:

Example: adding README.md to the drive
```
$ docker exec drive dfms-client drive baegaajaiaqjcbfh7iec4q2hwd62eclc7x3qbs67wqxcuo5ycbizw7ubwrstjmpte add /root/.dfms/README.md /README.md

Hash: bafkreiaqu576lbxf5tzfbeac6jul2tcd7xbyoq2vhoqkdwjjl22izumlbi
```

### Stop storage drive
```
./stop-director.sh
```
