
const { ethers } = require("hardhat");
require("@swisstronik/swisstronik.js");

async function mintTokens() {
  // Replace with your contract address and private key
  const contractAddress = "0x6196DE407ba242c1988eA93a86a8ab5Be76995a9";
  const privateKey = "privatekey";

  // Connect to the Swisstronik network
  const provider = new ethers.providers.JsonRpcProvider("https://json-rpc.testnet.swisstronik.com/");
  const wallet = new ethers.Wallet(privateKey, provider);

  // Load the contract
  const contract = await ethers.getContractAt("SwisstronikCoin", contractAddress, wallet);

  // Specify the recipient's address
  const recipientAddress = "0x0e9b25255462C0912b2a268b078045002f980Cc";

  // Specify the amount of tokens to mint
  const amountToMint = 100;

  // Call the mint function
  const tx = await contract.mint(recipientAddress, amountToMint);

  // Wait for the transaction to be mined
  await tx.wait();

  console.log(`Minted ${amountToMint} tokens to ${recipientAddress}`);
}

mintTokens()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
