# Troubleshooting Guide

Common issues and solutions for DeSocial.

## 🔴 Common Errors

### Error: "MetaMask not installed"

**Problem:** MetaMask extension not detected

**Solutions:**
1. Install MetaMask from https://metamask.io
2. Refresh the page after installation
3. Enable the extension in your browser
4. Check if extension is blocked by privacy settings

---

### Error: "Wallet not connected"

**Problem:** Trying to use features without connecting wallet

**Solutions:**
1. Click "Connect Wallet" button in navbar
2. Approve connection request in MetaMask
3. Make sure MetaMask is unlocked
4. Try refreshing the page

---

### Error: "Wrong network"

**Problem:** Connected to wrong blockchain network

**Solutions:**
1. Click network selector in MetaMask
2. Select the correct network (e.g., Polygon Amoy)
3. Or click "Switch Network" if app prompts
4. Check deployed contract network in README

**Manual Network Setup (Polygon Amoy):**
```
Network Name: Polygon Amoy
RPC URL: https://rpc-amoy.polygon.technology/
Chain ID: 80002
Currency Symbol: MATIC
Block Explorer: https://amoy.polygonscan.com/
```

---

### Error: "Insufficient funds for gas"

**Problem:** Not enough tokens to pay for transaction gas

**Solutions:**
1. Visit testnet faucet:
   - Polygon Amoy: https://faucet.polygon.technology/
   - Base Sepolia: https://bridge.base.org/
2. Request testnet tokens
3. Wait for confirmation
4. Try transaction again

---

### Error: "User rejected transaction"

**Problem:** Transaction was rejected in MetaMask

**Solutions:**
1. This is normal - you canceled the transaction
2. Click the action button again
3. Click "Confirm" in MetaMask this time
4. Check gas fee is reasonable

---

### Error: "Profile already exists"

**Problem:** Trying to create duplicate profile

**Solutions:**
1. You've already created a profile!
2. Use "Edit Profile" instead
3. Check profile page to verify

---

### Error: "Already liked"

**Problem:** Trying to like same post twice

**Solutions:**
1. This is by design - you can only like once
2. Heart icon should be filled (❤️) for liked posts
3. Refresh page to see current state

---

### Error: "Not admin" / "Not verifier"

**Problem:** Trying to use privileged functions

**Solutions:**
1. Admin functions only work for contract deployer
2. Verifier functions only work for assigned verifiers
3. Check your wallet address matches required role
4. Ask admin to grant you verifier role (if needed)

---

### Error: "Transaction failed"

**Problem:** Generic transaction failure

**Solutions:**
1. Check error message in MetaMask
2. Ensure you have enough gas
3. Verify you have permission for the action
4. Try increasing gas limit manually
5. Check block explorer for detailed error

---

### Error: "Post does not exist"

**Problem:** Trying to interact with invalid post ID

**Solutions:**
1. Refresh the page to update post list
2. Post may have been deleted
3. Check if you're on correct network
4. Clear browser cache

---

## 🔧 Development Issues

### Issue: Forge not found

**Problem:** Foundry/Forge not installed

**Solutions:**
```bash
# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

---

### Issue: Compilation failed

**Problem:** Solidity contract won't compile

**Solutions:**
1. Check Solidity version in contract matches foundry.toml
2. Run `forge install` to get dependencies
3. Run `forge clean` then `forge build`
4. Check for syntax errors

---

### Issue: Tests failing

**Problem:** `forge test` shows failures

**Solutions:**
1. Read error message carefully
2. Run with verbosity: `forge test -vvv`
3. Check if contract logic changed
4. Update tests to match contract changes
5. Verify test setup is correct

---

### Issue: ABI not found in frontend

**Problem:** Frontend can't find contract ABI

**Solutions:**
```bash
# Copy ABI to frontend
cd desocial
cp out/Basic.sol/DeSocialBasic.json ../frontend/src/assets/abi/DeSocialBasic.json
```

---

### Issue: Contract address not updated

**Problem:** Frontend connecting to wrong contract

**Solutions:**
1. Edit `frontend/src/app/core/services/desocial.service.ts`
2. Update `CONTRACT_ADDRESS` constant
3. Use address from deployment output
4. Restart frontend dev server

---

### Issue: npm install fails

**Problem:** Frontend dependencies won't install

**Solutions:**
1. Delete `node_modules` and `package-lock.json`
2. Run `npm install` again
3. Try `npm install --legacy-peer-deps`
4. Update Node.js to v18+
5. Clear npm cache: `npm cache clean --force`

---

### Issue: Port already in use

**Problem:** Frontend server won't start

**Solutions:**
1. Kill process on port 4200:
   - Windows: `netstat -ano | findstr :4200` then `taskkill /PID <PID> /F`
   - Mac/Linux: `lsof -ti:4200 | xargs kill -9`
2. Or use different port: `ng serve --port 4201`

---

## 🌐 MetaMask Specific Issues

### Issue: Transaction pending forever

**Problem:** Transaction stuck

**Solutions:**
1. Check block explorer for transaction status
2. Click "Speed Up" in MetaMask
3. Or "Cancel" and retry
4. Increase gas price for faster confirmation

---

### Issue: Nonce too high/low

**Problem:** Transaction nonce mismatch

**Solutions:**
1. Go to MetaMask Settings
2. Advanced → Reset Account
3. This clears transaction history
4. Try transaction again

---

### Issue: Can't switch networks

**Problem:** MetaMask won't change networks

**Solutions:**
1. Manually add network in MetaMask settings
2. Check network details are correct
3. Remove and re-add the network
4. Update MetaMask extension

---

## 🎨 UI/UX Issues

### Issue: Styles not loading

**Problem:** UI looks broken

**Solutions:**
1. Hard refresh: `Ctrl+Shift+R` (Windows) / `Cmd+Shift+R` (Mac)
2. Clear browser cache
3. Check browser console for errors
4. Verify styles.css is loaded

---

### Issue: Data not updating

**Problem:** UI shows stale data

**Solutions:**
1. Refresh the page
2. Check if transaction completed
3. Wait for block confirmation
4. Check browser console for errors

---

### Issue: Loading forever

**Problem:** Infinite loading state

**Solutions:**
1. Check browser console for errors
2. Verify wallet is connected
3. Verify contract address is correct
4. Check network RPC is responding
5. Try different RPC endpoint

---

## 🔍 Debugging Tips

### Check Browser Console

Press `F12` and look for:
- Red errors
- Network requests failing
- Web3 provider errors

### Check MetaMask Activity

1. Open MetaMask
2. Click Activity tab
3. Check recent transactions
4. Click transaction to see details
5. View on block explorer

### Check Block Explorer

Visit block explorer (e.g., https://amoy.polygonscan.com/):
1. Search for your address
2. View recent transactions
3. Check transaction status
4. Read revert reasons

### Test Contract Directly

Use block explorer's "Write Contract" feature:
1. Go to contract on explorer
2. Connect wallet
3. Test functions directly
4. Compare with frontend behavior

---

## 📞 Getting Help

If you're still stuck:

1. **Check Documentation:**
   - README.md
   - DEPLOYMENT_GUIDE.md
   - TESTING_GUIDE.md

2. **Search Issues:**
   - GitHub issues
   - Stack Overflow
   - Web3 forums

3. **Ask for Help:**
   - Open GitHub issue with:
     - Clear problem description
     - Steps to reproduce
     - Expected vs actual behavior
     - Screenshots/logs
     - Transaction hashes
     - Browser/OS info

4. **Community:**
   - Join Discord/Telegram (if available)
   - Ask in Web3 developer communities
   - Ethereum Stack Exchange

---

## ✅ Diagnostic Checklist

Before asking for help, verify:

- [ ] Foundry installed and updated
- [ ] Node.js v18+ installed
- [ ] MetaMask installed and unlocked
- [ ] On correct network
- [ ] Have testnet funds
- [ ] Contract deployed successfully
- [ ] Contract address updated in frontend
- [ ] ABI copied to frontend
- [ ] Frontend dependencies installed
- [ ] No console errors
- [ ] Tried hard refresh
- [ ] Tried different browser
- [ ] Checked block explorer

---

## 🚨 Critical Errors

### "Cannot read property of undefined"

**Likely cause:** Wallet not connected or contract not initialized

**Fix:**
```typescript
// Ensure wallet connected first
if (!this.wallet.isConnected()) {
  await this.wallet.connect();
  await this.desocial.init();
}
```

---

### "ethers object is undefined"

**Likely cause:** ethers.js not imported correctly

**Fix:**
```typescript
import { ethers } from 'ethers';
```

---

### "Contract execution reverted"

**Likely cause:** Smart contract validation failed

**Fix:**
- Read error message in block explorer
- Check function requirements
- Verify you have permission
- Verify inputs are valid

---

**Still having issues? Open an issue on GitHub with full details!**
