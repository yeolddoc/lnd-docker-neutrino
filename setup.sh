#!/bin/bash
echo "Creating Docker image"
docker build -t lnd-docker-neutrino .

echo "Running Docker container"
docker run -td -p 10009:10009 -p 9735:9735 --name lnd lnd-docker-neutrino

echo "Giving Docker container some time..."
sleep 120

mkdir data

echo "Retriving certificate"
docker cp lnd:/root/.lnd/tls.cert ./data/

echo "Retriving admin macaroon"
docker cp lnd:/root/.lnd/data/chain/bitcoin/testnet/admin.macaroon ./data/

echo "Getting and saving public key"
docker exec -t lnd lncli -n testnet getinfo > ./data/getinfo.json

echo "Creating new wallet address"
docker exec -t lnd lncli -n testnet newaddress np2wkh > ./data/address.json

echo "Finished"
