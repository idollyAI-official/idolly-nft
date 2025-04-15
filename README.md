# 🎤 IdollyNFT

**IdollyNFT** is a custom ERC-721 NFT smart contract deployed on the Base Sepolia testnet. This contract supports metadata storage, rarity tagging, and EIP-2981 compliant royalty configuration — making it ideal for platforms that need customizable NFT experiences like Idolly AI.

---

## ✨ Features

- ✅ **ERC-721 NFT Standard**  
  Built on OpenZeppelin's `ERC721URIStorage`.

- 🌐 **Base URI + Metadata URI**  
  Fully supports dynamic token metadata and contract-level metadata (for OpenSea).

- 🌈 **Rarity Attribute Per Token**  
  Each minted NFT can have a rarity value (e.g., "Common", "Rare", "Legendary").

- 💸 **Royalties (EIP-2981)**  
  Native royalty info returned for NFT marketplaces.

- 🔒 **Owner-only Minting**  
  Only the contract owner can mint NFTs to ensure controlled issuance.

---

## 📦 Contract Details

| Property           | Value                  |
|--------------------|------------------------|
| Name               | IdollyNFT              |
| Symbol             | IDOL                   |
| Chain              | Base Sepolia Testnet   |
| Standard           | ERC-721 (EIP-721)      |
| Royalty Standard   | EIP-2981               |

---

## 🛠️ How to Deploy (Using Hardhat)

> Make sure you have Node.js v16+ and Hardhat installed.

### 1. Clone the repository

```bash
git clone https://github.com/your-org/idolly-nft.git
cd idolly-nft
