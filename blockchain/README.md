# How to build, test and deploy the Smart Contracts
You'll go through the following steps:
- Compile
- Test
- Deploy to local testnet
- Deploy to public testnet (no money required)
- Deploy to mainnet (real money on stake)

## Requirements
You need to install the dependencies, Truffle and a local testnet.
```
$ cd blockchain
$ npm install
$ npm install -g truffle ethereumjs-testrpc
```
> Requires NodeJS 5.0+, MacOS, Linux or Windows



## Compile and test
First, start the local testnet in a terminal window.
```
$ testrpc
```

Open another terminal window. Compile, deploy to the local testnet and test the Smart Contracts:
```
$ truffle compile
$ truffle migrate
```

You should get an output similar to:
```
Using network 'development'.

Running migration: 1_initial_migration.js
  Deploying Migrations...
  ... 0xc72878275287454184e334a2584115e840e7666c1878a24803b9b8656f05ab81
  Migrations: 0xce7b28b919a7d916c5094f4b9eef49365eeeb2ec
Saving successful migration to network...
  ... 0x15f70a3d616eb228dfb31575aabe575749868c6f6807d26146fc6a08710a60e0
Saving artifacts...
Running migration: 1506615515_raffle.js
  Deploying Raffle...
  ... 0xf3d274aff454a85e11bf2d918bda320141e2b90aad09aa1774a41935291b7dce
  Raffle: 0xd4a13d8042a8935b70211a0f96169606da19b25d
Saving successful migration to network...
  ... 0x4db6ebe8a9837a3d8ae16fbe5a2654a7c0b90f8bf5fea196f0cc51bd9f5483f6
Saving artifacts...
```

Running the tests:
```
$ truffle test
```
All tests should be `passing`


## Smart Contract Deployment

There are several Blockchain networks where the smart contract (SM) can be deployed to. For instance:
- [testrpc](https://github.com/ethereumjs/testrpc): a fast Ethereum RPC client for local testing and development.
- [rinkeby](https://www.rinkeby.io): an Ethereum testnet with "play money" so that you can try out applications without spending real money.
- [ethereum](https://ethereum.org): *the* Ethereum mainnet (real money).


You've already deployed to the local testnet, let's move on to rinkeby

### Requirements
- [Install geth following](https://ethereum.org/cli#geth)
- [Install The Ethereum Wallet](https://ethereum.org) (Don't run it yet)


### Deploy to Rinkeby
Run geth connecting to rinkeby. Close the Ethereum Wallet if it's open.

```
geth --rinkeby --rpc --rpcapi db,eth,net,web3,personal
```

Whe the process starts, it outputs the IPC endpoint. Copy it.
For example:
```
INFO [10-09|23:20:34] IPC endpoint opened: /Users/manu/Library/Ethereum/rinkeby/geth.ipc 
```
> It will take some time the first time given that it needs to retrieve the blockchain DB. Go and grab a coffee, a mate or whatever you feel like.

Run the wallet connecting to your rinkeby node (this example is running it on Mac, I'm sure you'll figure it out using other OSs).
```
/Applications/Mist.app/Contents/MacOS/Mist --rpc /Users/manu/Library/Ethereum/rinkeby/geth.ipc 
```

Create a Wallet account and copy the address (e.g.: 0x0085f8DCs7as91Ce4BB5ce47541C846d0593M6fAAA)
Setup environment variables
```
$ cd blockchain
$ cp .env.sample .env
```
Replace `0x.....` with your copied wallet address.

Add some "Play Money" to you account following the instructions on https://faucet.rinkeby.io

Time to deploy:
```
$ truffle migrate --network rinkeby
```

Unfortunately you'll get the error `Error: authentication needed: password or unlock`
Fix it by restarting get unlocking the address where the Smart Contract will be deployed from (of course, use your address) and enter your Passphrase.

```
geth --rinkeby --rpc --rpcapi db,eth,net,web3,personal --unlock="0x0085f8DCs7as91Ce4BB5ce47541C846d0593M6fAAA"
\
```

 Run the migration command again.

 Check if everything is in place at:
 https://rinkeby.etherscan.io/address/0x0085f8DCs7as91Ce4BB5ce47541C846d0593M6fAAA


