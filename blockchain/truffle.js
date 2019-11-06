const HDWalletProvider = require("truffle-hdwallet-provider");
const MNEMONIC = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const api_key = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    },
    ropsten: {
      provider: function () {
        return new HDWalletProvider(MNEMONIC, `https://ropsten.infura.io/v3/${api_key}`)
      },
      network_id: 3,
      gas: 4000000      //make sure this gas allocation isn't over 4M, which is the max
    }
  },
  compilers: {
    solc: {
      version: "0.4.24",
      docker: false
    }
  }
};