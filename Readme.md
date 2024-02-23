# Laika AI SmartContract

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

## Change initialOwner address in deploy.ts

`let initialOwner = ""`

## Command for deploy script:

### Testnet Mumbai

`npx hardhat run scripts/deploy.ts --network mumbai `

### Polygon Mainnet

`npx hardhat run scripts/deploy.ts --network polygon`

## Exmaple .env

````ACCOUNT_PRIVATE_KEY = ""
MUMBAI_RPC_URL = ""
MUMBAI_SCAN_API_KEY = ""
MAINNET_ACCOUNT_PRIVATE_KEY=""
POLYGON_MAINNET_RPC_URL = ""
MAINNET_SCAN_API_KEY = "" ```
````
