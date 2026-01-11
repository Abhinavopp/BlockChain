# DeSocial Deployment Guide

This guide will walk you through deploying the DeSocial smart contract and connecting the frontend.

## 📋 Prerequisites Checklist

- [ ] Node.js v18+ installed
- [ ] Foundry installed (`curl -L https://foundry.paradigm.xyz | bash && foundryup`)
- [ ] MetaMask wallet with testnet funds
- [ ] Text editor (VS Code recommended)

## 🔧 Step 1: Prepare Your Wallet

### Get Testnet Funds

**For Polygon Amoy (Recommended)**
1. Visit https://faucet.polygon.technology/
2. Select "Amoy" network
3. Enter your wallet address
4. Request test MATIC

**For Base Sepolia**
1. Visit https://bridge.base.org/
2. Bridge some Sepolia ETH to Base Sepolia

## 🚀 Step 2: Deploy the Smart Contract

### 2.1 Set up environment variables

```bash
cd desocial
cp .env.example .env
```

Edit `.env` and add your private key (without 0x prefix):

```env
PRIVATE_KEY=your_private_key_here
RPC_URL=https://rpc-amoy.polygon.technology/
```

⚠️ **SECURITY WARNING**: Never commit your `.env` file or share your private key!

### 2.2 Compile the contract

```bash
forge build
```

Expected output:
```
[⠊] Compiling...
[⠒] Compiling 1 files with 0.8.20
[⠢] Solc 0.8.20 finished in X.XXs
Compiler run successful!
```

### 2.3 Run tests (optional but recommended)

```bash
forge test
```

All tests should pass ✅

### 2.4 Deploy to testnet

```bash
forge script script/Deploy.s.sol:DeployScript --rpc-url $RPC_URL --broadcast --verify -vvvv
```

Or if verification fails, deploy without verification:

```bash
forge script script/Deploy.s.sol:DeployScript --rpc-url $RPC_URL --broadcast -vvvv
```

### 2.5 Save the deployment information

The output will show:
```
DeSocialBasic deployed to: 0xYourContractAddress
Admin address: 0xYourWalletAddress
Created General community
```

**✅ Copy the contract address! You'll need it for the frontend.**

## 🎨 Step 3: Configure the Frontend

### 3.1 Copy the contract ABI

```bash
# From the desocial folder
cp out/Basic.sol/DeSocialBasic.json ../frontend/src/assets/abi/DeSocialBasic.json
```

### 3.2 Update the contract address

Edit `frontend/src/app/core/services/desocial.service.ts`:

```typescript
const CONTRACT_ADDRESS = '0xYourContractAddressFromStep2.5';
```

### 3.3 Install frontend dependencies

```bash
cd ../frontend
npm install
```

### 3.4 Start the development server

```bash
npm start
```

The app will open at `http://localhost:4200`

## 🎭 Step 4: Connect and Use the App

### 4.1 Configure MetaMask

Add the network if not already added:

**Polygon Amoy:**
- Network Name: Polygon Amoy
- RPC URL: https://rpc-amoy.polygon.technology/
- Chain ID: 80002
- Currency Symbol: MATIC
- Block Explorer: https://amoy.polygonscan.com/

### 4.2 Connect your wallet

1. Open `http://localhost:4200`
2. Click "Connect Wallet"
3. Approve the connection in MetaMask
4. Make sure you're on the correct network (Polygon Amoy)

### 4.3 Create your profile

1. Enter a username and bio
2. Click "Create Profile"
3. Approve the transaction in MetaMask
4. Wait for confirmation

### 4.4 Create your first post

1. Type your message
2. Select "General" community
3. Click "Post"
4. Approve the transaction
5. Wait for confirmation

🎉 **Success!** You're now using your decentralized social network!

## 🔍 Verification (Optional)

To verify your contract on block explorers for better transparency:

### Polygon Amoy

1. Get API key from https://polygonscan.com/apis
2. Add to `.env`: `POLYGONSCAN_API_KEY=your_key`
3. Run:
```bash
forge verify-contract <CONTRACT_ADDRESS> src/Basic.sol:DeSocialBasic --chain 80002 --etherscan-api-key $POLYGONSCAN_API_KEY
```

## 🐛 Troubleshooting

### "Insufficient funds" error
- Make sure you have enough testnet tokens
- Visit the faucet and request more funds

### "Wrong network" error
- Check MetaMask is connected to the right network (Polygon Amoy)
- The chain ID should be 80002

### "Transaction failed" error
- Check the error message in MetaMask
- Make sure you approved the transaction
- Ensure you have enough gas

### Contract ABI not found
- Make sure you copied the ABI file: `cp out/Basic.sol/DeSocialBasic.json ../frontend/src/assets/abi/DeSocialBasic.json`

### "Profile already exists" error
- You've already created a profile!
- Use "Update Profile" instead

## 📸 Testing All Features

### Basic Features (Beginner Level)
- ✅ Create profile
- ✅ Update profile
- ✅ Create post
- ✅ Like post
- ✅ View feed

### Intermediate Features
- ✅ Follow another user
- ✅ Unfollow user
- ✅ Report post
- ✅ Edit your post
- ✅ Delete your post
- ✅ View profile page
- ✅ Check reputation score

### Advanced Features
- ✅ Create community
- ✅ Create verified-only community
- ✅ Set verifier (admin only)
- ✅ Verify user (verifier only)
- ✅ Assign moderator
- ✅ Moderate post
- ✅ View analytics (admin only)

## 🌐 Production Deployment

### Deploy to Mainnet

⚠️ **WARNING**: Deploying to mainnet costs real money! Test thoroughly first!

1. Get mainnet funds (real MATIC for Polygon)
2. Update `.env` with mainnet RPC
3. Deploy using same process
4. Update frontend with production contract address
5. Build frontend for production: `npm run build`
6. Deploy frontend to hosting (Vercel, Netlify, etc.)

### Frontend Hosting Options

**Vercel (Recommended)**
```bash
npm install -g vercel
vercel
```

**Netlify**
```bash
npm run build
# Upload dist/frontend folder to Netlify
```

## 📝 Post-Deployment Tasks

1. **Document your deployment**
   - Update README.md with contract address
   - Add network details
   - Link to block explorer

2. **Share your dApp**
   - Tweet about it
   - Share on GitHub
   - Add to dApp directories

3. **Test with friends**
   - Have others create profiles
   - Test all interactions
   - Gather feedback

## 🎉 Congratulations!

You've successfully deployed a complete decentralized social network! 

### Next Steps
- Customize the UI styling
- Add more features
- Deploy to mainnet
- Build a community

---

Need help? Check the main README.md or open an issue on GitHub.
