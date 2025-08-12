# MusicNFT Platform

## Project Title
**MusicNFT Platform** - A Decentralized Music NFT Marketplace with Automatic Royalty Distribution

## Project Description
MusicNFT Platform is a blockchain-based decentralized application (dApp) that enables musicians and artists to mint their music as Non-Fungible Tokens (NFTs), sell them directly to fans, and automatically receive royalties from secondary sales. Built on Ethereum using Solidity smart contracts, the platform eliminates intermediaries and ensures artists maintain control over their intellectual property while receiving fair compensation for their work.

The platform allows artists to:
- Mint their music tracks as unique NFTs with metadata including title and genre
- Set custom royalty percentages for ongoing revenue from resales
- List their music NFTs for sale at desired prices
- Automatically receive royalty payments whenever their NFTs are resold
- Withdraw accumulated earnings seamlessly

Collectors and music fans can discover, purchase, and trade music NFTs while supporting their favorite artists directly.

## Project Vision
Our vision is to revolutionize the music industry by creating a decentralized ecosystem where:

1. **Artist Empowerment**: Musicians have complete control over their music distribution and pricing without relying on traditional record labels or streaming platforms that take significant revenue cuts.

2. **Fair Compensation**: Artists receive immediate payment for sales and automatic royalty payments from all future resales, ensuring ongoing revenue streams from their creative work.

3. **Direct Fan Connection**: Eliminate intermediaries between artists and fans, allowing direct support and engagement through NFT ownership.

4. **Transparent Ecosystem**: All transactions, royalty payments, and ownership transfers are recorded on the blockchain, providing complete transparency and trust.

5. **Global Accessibility**: Enable artists from anywhere in the world to monetize their music without geographical restrictions or complex licensing agreements.

## Key Features

### 🎵 **Music NFT Minting**
- Artists can mint their music tracks as ERC-721 NFTs
- Include metadata such as title, genre, and custom artwork
- Set royalty percentages (up to 10%) for secondary sales
- Permanent ownership records on the blockchain

### 💰 **Automatic Royalty System**
- Smart contract automatically calculates and distributes royalties
- Artists receive payments every time their NFT is resold
- Transparent and trustless royalty distribution
- No manual intervention required

### 🛒 **Decentralized Marketplace**
- List music NFTs for sale at custom prices
- Secure peer-to-peer transactions
- Built-in escrow functionality
- Platform fee of 2.5% to maintain the ecosystem

### 👛 **Earnings Management**
- Artists can track accumulated earnings
- Simple withdrawal function for easy access to funds
- Separate accounting for primary sales and royalty payments

### 🔒 **Security Features**
- ReentrancyGuard protection against attacks
- Access control for administrative functions
- Safe transfer mechanisms
- Input validation and error handling

## Future Scope

### Phase 1 - Enhanced Features (Q1-Q2 2024)
- **Batch Minting**: Allow artists to mint multiple tracks in a single transaction
- **Album Collections**: Create linked NFT collections for full albums
- **Advanced Metadata**: Support for additional fields like collaborators, producers, and release dates
- **Price Discovery**: Implement auction mechanisms and dynamic pricing

### Phase 2 - Community Features (Q2-Q3 2024)
- **Artist Profiles**: Comprehensive artist pages with social features
- **Fan Engagement**: Comments, ratings, and social interactions
- **Playlist Creation**: Users can create and share NFT playlists
- **Discovery Algorithm**: Recommend music based on ownership and preferences

### Phase 3 - Advanced Functionality (Q3-Q4 2024)
- **Streaming Integration**: Allow NFT holders to stream music directly
- **Fractional Ownership**: Enable multiple people to own shares of expensive NFTs
- **Cross-Chain Support**: Expand to other blockchain networks
- **Mobile Application**: Native iOS and Android apps

### Phase 4 - Ecosystem Expansion (2025)
- **DAO Governance**: Community-driven platform decisions
- **Creator Tools**: In-platform music creation and editing tools
- **Label Partnerships**: Integration with independent record labels
- **Metaverse Integration**: Display and play music NFTs in virtual worlds
- **DeFi Features**: Lending/borrowing against music NFT collateral

### Long-term Vision
- **AI-Powered Curation**: Intelligent music discovery and recommendation systems
- **Global Licensing**: Automated licensing for commercial use of music NFTs
- **Educational Platform**: Resources and tutorials for new artists entering Web3
- **Carbon Neutral Operations**: Implement eco-friendly blockchain solutions
- **Virtual Concerts**: Host live events where NFT holders get exclusive access

---

## Getting Started

### Prerequisites
- Node.js and npm
- Hardhat or Truffle development environment
- MetaMask or compatible Web3 wallet
- Test ETH for deployment and testing

### Installation
```bash
npm install @openzeppelin/contracts
```

### Deployment
1. Configure your deployment network in `hardhat.config.js`
2. Deploy the contract: `npx hardhat run scripts/deploy.js --network <network-name>`
3. Verify the contract on Etherscan (recommended)

### Contract Functions
- `mintMusicNFT()`: Mint new music NFTs
- `listForSale()`: List NFTs for sale
- `purchaseNFT()`: Buy listed NFTs
- `withdrawEarnings()`: Withdraw accumulated earnings
- `totalSupply()`: Get total minted tokens

## Contributing
We welcome contributions from developers, musicians, and community members. Please read our contributing guidelines and submit pull requests for any improvements.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

Contract Details : 0x5B52b430a2Abfcf5d921725cbe22b8971cCD5Cd7
ScreenShot:  <img width="1358" height="696" alt="Screenshot 2025-08-12 145043" src="https://github.com/user-attachments/assets/39a5ff47-b395-4d78-8716-c69dcfb2abf7" />
