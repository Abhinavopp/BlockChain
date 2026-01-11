#!/bin/bash

# DeSocial Quick Start Script
echo "🚀 DeSocial Quick Start"
echo "======================"
echo ""

# Check if forge is installed
if ! command -v forge &> /dev/null; then
    echo "❌ Foundry not found. Please install it first:"
    echo "   curl -L https://foundry.paradigm.xyz | bash"
    echo "   foundryup"
    exit 1
fi

# Check if node is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js v18+"
    exit 1
fi

echo "✅ Prerequisites check passed"
echo ""

# Install Solidity dependencies
echo "📦 Installing Solidity dependencies..."
cd desocial
forge install
echo ""

# Compile contracts
echo "🔨 Compiling smart contracts..."
forge build
if [ $? -ne 0 ]; then
    echo "❌ Compilation failed"
    exit 1
fi
echo "✅ Contracts compiled successfully"
echo ""

# Run tests
echo "🧪 Running tests..."
forge test
if [ $? -ne 0 ]; then
    echo "❌ Tests failed"
    exit 1
fi
echo "✅ All tests passed"
echo ""

# Copy ABI to frontend
echo "📋 Copying ABI to frontend..."
mkdir -p ../frontend/src/assets/abi
cp out/Basic.sol/DeSocialBasic.json ../frontend/src/assets/abi/DeSocialBasic.json
echo "✅ ABI copied"
echo ""

# Install frontend dependencies
echo "📦 Installing frontend dependencies..."
cd ../frontend
npm install
echo "✅ Frontend dependencies installed"
echo ""

echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "1. Deploy contract: cd desocial && forge script script/Deploy.s.sol:DeployScript --rpc-url \$RPC_URL --broadcast"
echo "2. Update contract address in: frontend/src/app/core/services/desocial.service.ts"
echo "3. Start frontend: cd frontend && npm start"
echo ""
echo "📖 Read DEPLOYMENT_GUIDE.md for detailed instructions"
