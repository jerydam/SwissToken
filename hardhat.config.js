require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.19",
  networks: {
    swisstronik: {
      url: "https://json-rpc.testnet.swisstronik.com/", //URL of the RPC node for Swisstronik.
      accounts: ["0xfd567b9287a19dce82f2ad4503178af848e6ca1d681388cabf6847b165338b2e"], //Your private key starting with "0x" 
      //Make sure you have enough funds in this wallet to deploy the smart contract
    },
  },
};