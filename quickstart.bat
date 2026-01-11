@echo off
REM DeSocial Quick Start Script for Windows

echo 🚀 DeSocial Quick Start
echo ======================
echo.

REM Check if forge is installed
where forge >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Foundry not found. Please install it first:
    echo    Visit: https://book.getfoundry.sh/getting-started/installation
    exit /b 1
)

REM Check if node is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Node.js not found. Please install Node.js v18+
    exit /b 1
)

echo ✅ Prerequisites check passed
echo.

REM Install Solidity dependencies
echo 📦 Installing Solidity dependencies...
cd desocial
call forge install
echo.

REM Compile contracts
echo 🔨 Compiling smart contracts...
call forge build
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Compilation failed
    exit /b 1
)
echo ✅ Contracts compiled successfully
echo.

REM Run tests
echo 🧪 Running tests...
call forge test
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Tests failed
    exit /b 1
)
echo ✅ All tests passed
echo.

REM Copy ABI to frontend
echo 📋 Copying ABI to frontend...
if not exist "..\frontend\src\assets\abi" mkdir "..\frontend\src\assets\abi"
copy "out\Basic.sol\DeSocialBasic.json" "..\frontend\src\assets\abi\DeSocialBasic.json"
echo ✅ ABI copied
echo.

REM Install frontend dependencies
echo 📦 Installing frontend dependencies...
cd ..\frontend
call npm install
echo ✅ Frontend dependencies installed
echo.

echo 🎉 Setup complete!
echo.
echo Next steps:
echo 1. Deploy contract: cd desocial ^&^& forge script script/Deploy.s.sol:DeployScript --rpc-url %%RPC_URL%% --broadcast
echo 2. Update contract address in: frontend/src/app/core/services/desocial.service.ts
echo 3. Start frontend: cd frontend ^&^& npm start
echo.
echo 📖 Read DEPLOYMENT_GUIDE.md for detailed instructions
