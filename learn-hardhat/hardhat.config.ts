import type { HardhatUserConfig } from "hardhat/config";

import hardhatToolboxViemPlugin from "@nomicfoundation/hardhat-toolbox-viem";

const config: {
  plugins: HardhatPlugin[];
  etherscan: {
    apiKey: { roothash: string };
    customChains: { urls: { apiURL: string; browserURL: string }; chainId: number; network: string }[]
  };
  networks: {
    hardhatOp: { chainType: string; type: string };
    roothash: { chainType: string; accounts: string[]; type: string; url: string };
    hardhatMainnet: { chainType: string; type: string }
  };
  solidity: {
    profiles: {
      default: { version: string };
      production: { settings: { optimizer: { runs: number; enabled: boolean } }; version: string }
    }
  }
} = {
  plugins: [hardhatToolboxViemPlugin],
  solidity: {
    profiles: {
      default: {
        version: "0.8.28",
      },
      production: {
        version: "0.8.28",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
    },
  },
  networks: {
    hardhatMainnet: {
      type: "edr-simulated",
      chainType: "l1",
    },
    hardhatOp: {
      type: "edr-simulated",
      chainType: "op",
    },
    roothash: {
      type: "http",
      chainType: "l1",
      url: "https://rpc.roothashpay.com",
      accounts: ["0x5cee86cfac9b46271055a89bd872e0dd6c3764f71354f790d151ab210e7c10ec"],
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

export default config;
