# Brownie Vyper
***Brownie Vyper*** is a purely pythonic implementation of Brownie framework without use Ganache-CLI.

# Requirements
* [Dcoker](https://www.docker.com/)
* [Python 3.6 or greater](https://www.python.org/downloads/)
* [Brownie 1.7.x](https://github.com/eth-brownie/brownie)
* [Vyper 0.3.x](https://github.com/vyperlang/vyper)
* [Go Ethereum](https://geth.ethereum.org/)

# Starting up
***Running the docker container***
```
docker-compose up
```

***Connecting Brownie to Geth***
```
docker exec <brownie_container> brownie networks add <env> <id> host=<geth_provider_url>:<port> chainid=<chain_id>
```

Example:
```
docker exec contract brownie networks add DevEth deveth host=http://172.22.0.7:8545 chainid=1234
```

This should be done on the `docker-compose.yml`, service `command`.
```
services:
    contract:
        ...
        command: brownie networks add DevEth deveth host=http://172.22.0.7:8545 chainid=12345
...
```

However, the services container stops. We need to manually connect the Brownie framework to the network provider.

We also set static IP in our `node_1` service, so we know exactly where to connect our Brownie.
```
services:
    node_1:
        ...
        networks:
            ipv4_address: 172.22.0.7
...
```

# Testing
***Manual Brownie connection to Geth***
```
docker exec contract brownie console
```

Type `network.is_connected()` in the brownie console.
```
BrownieVyperProject is the active project.
Brownie environment is ready.
>>> network.is_connected()
True
```
