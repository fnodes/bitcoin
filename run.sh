#!/bin/bash
docker pull fullnodes/bitcoin:latest
docker stop bitcoind
docker rm bitcoind
docker volume create bitcoin
docker run -dit --name bitcoind --net=host --restart=always -e 'BTC_RPCUSER=admin' -e 'BTC_RPCPASSWORD=changeme' -e 'BTC_TXINDEX=1' -e 'BTC_DISABLE_WALLET=0' -v bitcoin:/root/.bitcoin fullnodes/bitcoin:latest
