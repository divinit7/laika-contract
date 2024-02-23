import hre from "hardhat";

async function main() {

  // change wallet address to initialOwner Address 
  let initialOwner = "0xfEceA7b046b4DaFACE340c7A2fe924cf41b6d274"

  const ContractFactory = await hre.ethers.getContractFactory("LaikaAI");
  const instance = await ContractFactory.deploy(initialOwner);
  await instance.waitForDeployment();
  let contractAddress = await instance.getAddress()
  console.log("LaikaAI contract deployed at: ", contractAddress);

  // sleep for 5 seconds
  await new Promise((resolve) => setTimeout(resolve, 5000));

  // verify contract
  console.log("Verify contract process...")
  await hre.run("verify:verify", {
    address: contractAddress,
    constructorArguments: [initialOwner],
  });
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
