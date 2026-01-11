# 🚀 DeSocial Developer Quick Reference

Quick reference for common tasks and commands.

## 📦 Installation Commands

```bash
# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup

# Clone and setup
git clone <your-repo>
cd desocial

# Install Solidity dependencies
cd desocial
forge install

# Install frontend dependencies
cd ../frontend
npm install
```

## 🔨 Development Commands

### Smart Contract

```bash
cd desocial

# Compile
forge build

# Test
forge test                    # Run all tests
forge test -vv               # Verbose
forge test -vvv              # Very verbose
forge test --gas-report      # With gas report
forge test --watch           # Watch mode

# Clean build artifacts
forge clean

# Check coverage
forge coverage
```

### Frontend

```bash
cd frontend

# Development server
npm start                    # Starts on http://localhost:4200

# Production build
npm run build

# Lint
npm run lint

# Format
npm run format
```

## 🚀 Deployment Commands

### Deploy Contract

```bash
cd desocial

# Set environment
export PRIVATE_KEY=your_key
export RPC_URL=https://rpc-amoy.polygon.technology/

# Deploy
forge script script/Deploy.s.sol:DeployScript \
  --rpc-url $RPC_URL \
  --broadcast \
  -vvvv

# Deploy with verification
forge script script/Deploy.s.sol:DeployScript \
  --rpc-url $RPC_URL \
  --broadcast \
  --verify \
  --etherscan-api-key $ETHERSCAN_API_KEY \
  -vvvv
```

### Update Frontend

```bash
# Copy ABI
cd desocial
cp out/Basic.sol/DeSocialBasic.json ../frontend/src/assets/abi/DeSocialBasic.json

# Update contract address in:
# frontend/src/app/core/services/desocial.service.ts
```

## 🔧 Useful Forge Commands

```bash
# Format code
forge fmt

# Check gas snapshots
forge snapshot

# Generate documentation
forge doc

# Install library
forge install <org>/<repo>

# Update dependencies
forge update

# Remove library
forge remove <lib>
```

## 📝 Contract Interactions (Cast)

```bash
# Read functions
cast call $CONTRACT "postCount()" --rpc-url $RPC_URL

# Write functions
cast send $CONTRACT \
  "registerProfile(string,string)" \
  "Alice" "Hello World" \
  --private-key $PRIVATE_KEY \
  --rpc-url $RPC_URL

# Get block number
cast block-number --rpc-url $RPC_URL

# Get balance
cast balance $ADDRESS --rpc-url $RPC_URL
```

## 🌐 Network Configurations

### Polygon Amoy
```bash
RPC_URL=https://rpc-amoy.polygon.technology/
CHAIN_ID=80002
EXPLORER=https://amoy.polygonscan.com/
FAUCET=https://faucet.polygon.technology/
```

### Base Sepolia
```bash
RPC_URL=https://sepolia.base.org
CHAIN_ID=84532
EXPLORER=https://sepolia.basescan.org/
BRIDGE=https://bridge.base.org/
```

## 🧪 Testing Patterns

### Basic Test
```solidity
function testSomething() public {
    vm.startPrank(user1);
    desocial.someFunction();
    vm.stopPrank();
    
    assertEq(desocial.someValue(), expectedValue);
}
```

### Test Revert
```solidity
function testCannotDoSomething() public {
    vm.expectRevert("Error message");
    desocial.someFunction();
}
```

### Test Event
```solidity
function testEmitsEvent() public {
    vm.expectEmit(true, true, false, true);
    emit SomeEvent(param1, param2);
    desocial.someFunction();
}
```

## 📊 Frontend Patterns

### Call Contract (Read)
```typescript
const value = await this.desocial.contract!['someView']();
```

### Send Transaction (Write)
```typescript
const tx = await this.desocial.contract!['someFunction'](params);
await tx.wait();
```

### Handle Loading
```typescript
this.loading.set(true);
try {
  await this.doSomething();
} catch (error) {
  alert('Error: ' + error.message);
} finally {
  this.loading.set(false);
}
```

## 🔍 Debugging

### Check Contract Events
```bash
# Using cast
cast logs --address $CONTRACT --rpc-url $RPC_URL

# Check specific event
cast logs \
  --address $CONTRACT \
  --topic "0x..." \
  --rpc-url $RPC_URL
```

### Check Transaction
```bash
cast tx $TX_HASH --rpc-url $RPC_URL
cast receipt $TX_HASH --rpc-url $RPC_URL
```

### Check Account
```bash
cast balance $ADDRESS --rpc-url $RPC_URL
cast nonce $ADDRESS --rpc-url $RPC_URL
```

## 🎯 Common Tasks

### Add New Feature to Contract

1. Add function to contract
2. Add event (if needed)
3. Write test
4. Compile: `forge build`
5. Test: `forge test`
6. Update frontend service
7. Update UI component

### Add New Page to Frontend

1. Create component: `ng generate component pages/new-page`
2. Add route in `app.routes.ts`
3. Add navigation link in navbar
4. Implement component logic
5. Style component
6. Test functionality

### Deploy Update

1. Update contract code
2. Test: `forge test`
3. Deploy new version
4. Update contract address in frontend
5. Copy new ABI
6. Test frontend with new contract
7. Update documentation

## 📚 Important Files

### Smart Contract
```
desocial/src/Basic.sol           - Main contract
desocial/test/Basic.t.sol        - Tests
desocial/script/Deploy.s.sol     - Deployment script
desocial/foundry.toml            - Foundry config
desocial/.env                    - Environment variables
```

### Frontend
```
frontend/src/app/app.routes.ts              - Routes
frontend/src/app/core/services/*.ts         - Services
frontend/src/app/pages/*/                   - Page components
frontend/src/app/components/navbar/         - Navbar
frontend/src/assets/abi/DeSocialBasic.json  - Contract ABI
```

## 🔐 Security Reminders

- ❌ Never commit `.env` file
- ❌ Never commit private keys
- ❌ Never commit API keys
- ✅ Always use `.env.example` for templates
- ✅ Always validate inputs
- ✅ Always check permissions

## 🐛 Quick Fixes

### Contract won't compile
```bash
forge clean
forge install
forge build
```

### Tests failing
```bash
forge test -vvv  # See detailed errors
```

### Frontend errors
```bash
rm -rf node_modules package-lock.json
npm install
```

### MetaMask issues
```
Settings → Advanced → Reset Account
```

## 📞 Quick Links

- **Foundry Book:** https://book.getfoundry.sh/
- **Solidity Docs:** https://docs.soliditylang.org/
- **ethers.js Docs:** https://docs.ethers.org/v6/
- **Angular Docs:** https://angular.io/docs
- **Polygon Faucet:** https://faucet.polygon.technology/

## 🎯 Git Commands

```bash
# Save work
git add .
git commit -m "Description"
git push

# Create branch
git checkout -b feature-name

# Merge branch
git checkout main
git merge feature-name

# Undo changes
git reset --hard HEAD
git clean -fd
```

## ⚡ Pro Tips

1. **Use verbose flags** for debugging: `-vvv`, `-vvvv`
2. **Test locally first** before deploying
3. **Keep gas costs low** with view functions
4. **Cache contract data** in frontend
5. **Use events** for off-chain indexing
6. **Document everything** as you code
7. **Test edge cases** thoroughly
8. **Version control** frequently

## 🚨 Emergency Commands

### Revert Bad Commit
```bash
git revert HEAD
git push
```

### Force Clean
```bash
forge clean
rm -rf out cache
forge build
```

### Reset Node Modules
```bash
rm -rf node_modules package-lock.json
npm cache clean --force
npm install
```

### Kill Stuck Port
```bash
# Mac/Linux
lsof -ti:4200 | xargs kill -9

# Windows
netstat -ano | findstr :4200
taskkill /PID <PID> /F
```

---

**Bookmark this page for quick reference! 📌**
