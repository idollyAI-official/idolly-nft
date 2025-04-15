# 🎤 IdollyNFT

**IdollyNFT** is an ERC-721 NFT contract for the Idolly AI platform, designed to mint unique NFTs with rarity metadata and EIP-2981 royalties. It is deployed on the **Base Sepolia Testnet** and provides metadata flexibility for integration with marketplaces like OpenSea.

---

## ✨ Features

- ✅ ERC-721 URI Storage  
- 🌈 Rarity Metadata Per Token  
- 💸 EIP-2981 Royalties  
- 🔐 Owner-only Minting  
- 🌐 Base URI and Collection Metadata Support  

---

## 🛠️ Deployment (Using Hardhat)

### 1. Clone the Repository

git clone https://github.com/your-org/idolly-nft.git  
cd idolly-nft

### 2. Install Dependencies

npm install

### 3. Environment Setup

Create a `.env` file:

PRIVATE_KEY=your_private_key  
BASE_SEPOLIA_RPC=https://sepolia.base.org

### 4. Hardhat Config (`hardhat.config.js`)

require("dotenv").config();

module.exports = {  
  solidity: "0.8.17",  
  networks: {  
    baseSepolia: {  
      url: process.env.BASE_SEPOLIA_RPC,  
      accounts: [process.env.PRIVATE_KEY],  
    },  
  },  
};

### 5. Compile and Deploy

npx hardhat compile  
npx hardhat run scripts/deploy.js --network baseSepolia

---

## 🔃 Mint Example

const { ethers } = require("hardhat");

async function main() {  
  const contract = await ethers.getContractAt("IdollyNFT", "0xYourContractAddress");

  const tx = await contract.mint(  
    "0xRecipientAddress",  
    "Legendary",  
    "ipfs://QmExampleURI"  
  );

  await tx.wait();  
  console.log("NFT Minted!");  
}

main();

---

## 🔎 Smart Contract Overview

| Function                | Description                               |
|-------------------------|-------------------------------------------|
| `mint(to, rarity, uri)` | Mint a new NFT with rarity (owner-only)   |
| `getRarity(tokenId)`    | View rarity metadata of the NFT           |
| `contractURI()`         | Returns collection metadata URI           |
| `royaltyInfo(...)`      | Returns EIP-2981 royalty info             |

---

## 📂 Repository Structure (Example)

idolly-nft/  
├── contracts/  
│   └── IdollyNFT.sol  
├── scripts/  
│   └── deploy.js  
├── .env  
├── hardhat.config.js  
├── package.json  
└── README.md  

---

## 📄 License (MIT)

MIT License

Copyright (c) 2025 Idolly

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

---

## 🤝 Contributing

Thanks for your interest! We welcome contributions to improve IdollyNFT.

### How to Contribute

1. Fork the repository.  
2. Create a new branch: `git checkout -b my-feature`.  
3. Make your changes.  
4. Commit and push: `git commit -m 'Add feature' && git push origin my-feature`.  
5. Open a Pull Request!

### Code Style

- Follow Solidity best practices (0.8.x)  
- Run `npx hardhat compile` before committing  

### Code of Conduct

Please be respectful and inclusive in your communication.

---

## 🔐 Security Policy

### Supported Versions

Only the latest version of this smart contract is actively maintained.

### Reporting a Vulnerability

If you discover a security vulnerability, please report it privately by emailing: **security@idolly.ai**

We will respond as quickly as possible and coordinate a fix before public disclosure.

---

## 💬 Contact

Built by [Idolly AI](https://idolly.ai) — feel free to open issues or feature requests!
