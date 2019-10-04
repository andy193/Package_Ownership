const HDWalletProvider = require('truffle-hdwallet-provider');
const infuraKey = "fj4jll3k.....";

const mnemonic = "fire stereo manage entire ill diet imitate noodle ostrich cruel rough rich";

module.exports = {
  networks: {
    development: {
     host: "localhost",     // Localhost (default: none)
     port: 8545,            // Standard Ethereum port (default: none)
     network_id: "*",       // Any network (default: none)
     gas: 6200000,
    },
    kovan: {
      provider: () => new HDWalletProvider(mnemonic, `https://kovan.infura.io/v3/2aa552ff612b44b29132c756e36a135e`),
      network_id: 42,        // Kovan's id
      confirmations: 0,      // # of confs to wait between deployments. (default: 0)
      timeoutBlocks: 100,    // # of blocks before a deployment times out  (minimum/default: 50)
      skipDryRun: false,     // Skip dry run before migrations? (default: false for public nets )
      gasPrice: 20000000000,  //Gas price used for deploys. Default is 100000000000 (100 Shannon).
      gas: 8000000            // Gas limit used for deploys. Default is 6721975
    },
  },
  compilers: {
    solc: {
      version: "0.5.11",    // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      // settings: {          // See the solidity docs for advice about optimization and evmVersion
      //  optimizer: {
      //    enabled: false,
      //    runs: 200
      //  },
      //  evmVersion: "byzantium"
      // }
    }
  },
  plugins: [
    'truffle-plugin-verify'
  ],
  api_keys: {
    etherscan: '5FBD3G41W74CIM7M9DSMZI8UZVMQTBNYU1'
  }
}
