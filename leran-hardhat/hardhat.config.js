require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: "0.8.28",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  networks: {
    sepolia: {
      url: "https://sepolia.infura.io/v3/apiKey",
      accounts: ["0x5cee86cfac9b46271055a89bd872e0dd6c3764f71354f790d151ab210e7c10ec"]
    },
    bsctest: {
      url: `https://data-seed-prebsc-1-s1.binance.org:8545/`,
      accounts: ["0x5cee86cfac9b46271055a89bd872e0dd6c3764f71354f790d151ab210e7c10ec"]
    },
    roothash: {
      chainId: 90102,
      url: `https://rpc.roothashpay.com`,
      accounts: ["0x5cee86cfac9b46271055a89bd872e0dd6c3764f71354f790d151ab210e7c10ec"]
    },
  },
  etherscan: {
    apiKey: {
      'roothash': 'empty'
    },
    customChains: [
      {
        network: "roothash",
        chainId: 90102,
        urls: {
          apiURL: "https://explorer.roothashpay.com/api",
          browserURL: "https://explorer.roothashpay.com"
        }
      }
    ]
  }
};
