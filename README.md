# 🌐 DeSocial - Decentralized Social Network

A fully-featured, wallet-native decentralized social network built on blockchain with Solidity, Foundry, Angular, and ethers.js.

**🎯 Complete Implementation**: All Beginner, Intermediate, and Advanced features fully functional!

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Solidity](https://img.shields.io/badge/Solidity-0.8.20-blue)](https://soliditylang.org/)
[![Angular](https://img.shields.io/badge/Angular-21-red)](https://angular.io/)

---

## � Documentation

- **[README.md](README.md)** - This file (overview)
- **[DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)** - Step-by-step deployment instructions
- **[TESTING_GUIDE.md](TESTING_GUIDE.md)** - Comprehensive testing guide
- **[FEATURES.md](FEATURES.md)** - Complete feature documentation
- **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** - Common issues and solutions
- **[WRITTEN_ANSWERS.md](WRITTEN_ANSWERS.md)** - Answers to additional questions
- **[SCREENSHOTS.md](SCREENSHOTS.md)** - Demo and screenshot guide

## �🚀 Features

### Beginner Level (Basic Social Network)
- ✅ Profile registration and management
- ✅ Create, edit, and delete posts
- ✅ Like posts (one like per user)
- ✅ Global feed view
- ✅ Event emissions for all actions

### Intermediate Level (Social Graph & Reputation)
- ✅ Follow/unfollow users
- ✅ Reputation system based on likes and reports
- ✅ Report posts
- ✅ Soft delete posts
- ✅ Following feed
- ✅ Profile pages with user stats

### Advanced Level (Verified Identities & Communities)
- ✅ Role-based verification system (Admin, Verifier, Verified Users)
- ✅ Gated communities (verified-only and public)
- ✅ Community moderation system
- ✅ Admin dashboard with analytics
- ✅ Moderator assignment per community

## 📋 Prerequisites

- Node.js v18+ and npm
- [Foundry](https://book.getfoundry.sh/getting-started/installation) for Solidity development
- MetaMask or another Web3 wallet

## 🎬 Quick Start

Want to get started immediately? Use our quick start script!

**Windows:**
```bash
quickstart.bat
```

**Mac/Linux:**
```bash
chmod +x quickstart.sh
./quickstart.sh
```

Or follow the manual steps below.

## 🛠️ Installation

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd desocial
```

### 2. Install Solidity dependencies

```bash
cd desocial
forge install
```

### 3. Install Frontend dependencies

```bash
cd ../frontend
npm install
```

## 🧪 Testing Smart Contracts

Run the Foundry test suite:

```bash
cd desocial
forge test
```

Run tests with verbosity:

```bash
forge test -vvv
```

Run tests with gas reporting:

```bash
forge test --gas-report
```

## 📦 Deploying the Smart Contract

### 1. Set up environment variables

Create a `.env` file in the `desocial` folder:

```env
PRIVATE_KEY=your_private_key
RPC_URL=https://rpc-amoy.polygon.technology/  # Or your preferred testnet
ETHERSCAN_API_KEY=your_etherscan_api_key  # Optional, for verification
```

### 2. Deploy to testnet

```bash
forge script script/Deploy.s.sol:DeployScript --rpc-url $RPC_URL --broadcast --verify
```

### 3. Note the deployed contract address

After deployment, copy the contract address from the output.

## 🎨 Running the Frontend

### 1. Update the contract address

Edit `frontend/src/app/core/services/desocial.service.ts`:

```typescript
const CONTRACT_ADDRESS = 'YOUR_DEPLOYED_CONTRACT_ADDRESS';
```

### 2. Update the ABI

Copy the contract ABI:

```bash
# From the desocial folder
cp out/Basic.sol/DeSocialBasic.json ../frontend/src/assets/abi/DeSocialBasic.json
```

### 3. Start the development server

```bash
cd frontend
npm start
```

The app will be available at `http://localhost:4200`

### 4. Connect MetaMask

- Open the app in your browser
- Click "Connect Wallet"
- Make sure MetaMask is connected to the same network where you deployed the contract

## 📱 Using the Application

### First Time Setup

1. **Connect Wallet**: Click "Connect Wallet" in the navbar
2. **Create Profile**: Enter a username and bio to create your profile
3. **Create First Community**: Navigate to Communities and create a general community

### Regular Use

#### Creating Posts
- Enter content in the text area
- Select a community
- Click "Post"

#### Interacting with Posts
- ❤️ Like posts (one time per post)
- 🚩 Report inappropriate posts
- View author profiles
- Edit/delete your own posts

#### Following Users
- Visit any user's profile
- Click "Follow" to follow them
- Switch to "Following" tab in the feed to see posts from followed users

#### Communities
- Browse existing communities
- Create new communities (public or verified-only)
- Manage moderators if you created a community

#### Admin Features (Contract Owner Only)
- Access via `/admin` route
- Add/remove verifiers
- View platform statistics

#### Verifier Features (Assigned Verifiers Only)
- Verify/unverify users
- Check verification status

## 📊 Smart Contract Architecture

### Main Contract: `DeSocialBasic.sol`

**Key Data Structures:**
- `Profile`: username, bio, exists flag
- `Post`: id, author, contentURI, timestamp, likeCount, reportCount, deleted flag
- `Community`: id, name, description, verifiedOnly flag, creator

**Key Mappings:**
- `profiles`: address → Profile
- `posts`: uint256 → Post
- `liked`: postId → address → bool
- `reported`: postId → address → bool
- `isFollowing`: follower → followed → bool
- `isVerified`: address → bool
- `isModerator`: communityId → address → bool

**Access Control:**
- `admin`: Contract owner (deployer)
- `isVerifier`: Addresses that can verify users
- `isVerified`: Verified user addresses

## 🔐 Security Features

1. **Duplicate Prevention**: Users cannot like or report the same post twice
2. **Ownership Checks**: Only post authors can edit/delete their posts
3. **Role-Based Access**: Admin and Verifier roles for sensitive operations
4. **Community Gating**: Verified-only communities restrict posting
5. **Soft Deletes**: Posts are marked deleted, not removed (for audit trail)

## 🎯 Future Enhancements

- IPFS integration for storing post content
- NFT profile pictures
- Token-gated communities
- Tipping mechanism
- Advanced search and filtering
- Mobile app (React Native)
- Direct messaging
- Post media attachments

## 🌐 Supported Networks

The contract can be deployed to any EVM-compatible chain:

- **Polygon Amoy (Testnet)** - Recommended
  - RPC: https://rpc-amoy.polygon.technology/
  - Faucet: https://faucet.polygon.technology/

- **Base Sepolia (Testnet)**
  - RPC: https://sepolia.base.org
  - Bridge: https://bridge.base.org/

- **Ethereum Sepolia (Testnet)**
  - RPC: https://sepolia.infura.io/v3/YOUR-PROJECT-ID
  - Faucet: https://sepoliafaucet.com/

## 📄 Contract Details

- **Solidity Version**: ^0.8.20
- **License**: MIT
- **Test Framework**: Foundry
- **Frontend**: Angular 21 + ethers.js v6

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License.

## 🔗 Deployed Contract

**Network**: [Your Network Name]  
**Contract Address**: `[Your Deployed Address]`  
**Block Explorer**: [Link to Explorer]

---

Built with ❤️ using Solidity, Foundry, Angular, and ethers.js
