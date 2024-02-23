import "@nomicfoundation/hardhat-toolbox";
import dotenv from 'dotenv';
dotenv.config();

const defaultKey = "0000000000000000000000000000000000000000000000000000000000000000";

const config = {
  solidity: {
    version: "0.8.20",
    settings: {
      optimizer: {
        "enabled": true,
        "runs":  200,
      },
      "evmVersion": "istanbul",
    },
  },
  etherscan: {
    apiKey: {
      polygonMumbai: process.env.MUMBAI_SCAN_API_KEY,
      polygon: process.env.MAINNET_SCAN_API_KEY
    }
  },
  networks: {
    mumbai: {
      url: process.env.MUMBAI_RPC_URL || '',
      accounts: [process.env.ACCOUNT_PRIVATE_KEY || defaultKey]
    },
    polygon:{
      url: process.env.POLYGON_MAINNET_RPC_URL || '',
      accounts: [process.env.MAINNET_ACCOUNT_PRIVATE_KEY || defaultKey]
    },
    hardhat: {
      chainId: 421613 
    }
  },
};

export default config;
