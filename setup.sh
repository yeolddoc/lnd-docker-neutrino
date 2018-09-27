#!/bin/bash
echo "Creating Docker image"
docker build -t lnd-docker-neutrino .

echo "Running Docker container"
docker run -td --name lnd lnd-docker-neutrino

echo "Giving Docker container some time..."
sleep 120

echo "Getting and saving public key"
docker exec -t lnd lncli -n testnet getinfo > getinfo.json

echo "Creating new wallet address"
docker exec -t lnd lncli -n testnet newaddress np2wkh > address.json

echo "Finished"
