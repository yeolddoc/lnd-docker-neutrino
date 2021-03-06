
# How to setup LND with Docker/Testnet/Neutrino

## Prerequisites

### Clone repository
```bash
$ git clone https://github.com/yeolddoc/lnd-docker-neutrino.git
$ cd lnd-docker-neutrino
```


## Auto Setup (Create image + run container + get public key + address)
```bash
$ chmod +x setup.sh
$ ./setup.sh
```

## Manual Setup

### Create image
```bash
$ docker build -t lnd-docker-neutrino .
```

### Run container
```bash
$ docker run -td -p 10009:10009 -p 9735:9735 --name lnd lnd-docker-neutrino
```

### Get Public Key
```bash
$ docker exec -t lnd lncli -n testnet getinfo > getinfo.json
```

### Get Wallet address
```bash
$ docker exec -t lnd lncli -n testnet newaddress np2wkh > address.json
```
