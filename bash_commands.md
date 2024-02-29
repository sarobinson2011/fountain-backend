# forge script script/deploy_lockdrop.s.sol:Deploy --rpc-url ${SEPOLIA_RPC_URL} --broadcast --legacy --verify -vv --etherscan-api-key ${ETHERSCAN_API_KEY}

# forge script script/deploy_lockdrop.s.sol:Deploy --rpc-url ${ARBITRUM_SEPOLIA_RPC_URL} --broadcast --verify -vv --etherscan-api-key ${ARBISCAN_API_KEY} --verifier-url ${ARBITRUM_SEPOLIA_API} --private-key ${PRIVATE_KEY} 

# forge script script/use_lockdrop.s.sol:Deploy --rpc-url ${ARBITRUM_SEPOLIA_RPC_URL} --broadcast

# 1.
# forge script script/deploy_lockdrop.s.sol:Deploy --rpc-url ${AURORA_TEST_RPC_URL} --broadcast --legacy --verify -vv --etherscan-api-key ${AURORA_API_KEY} --verifier blockscout --verifier-url ${AURORA_API} --private-key ${PRIVATE_KEY}

# 2.
# forge verify-contract 0x8B837BB58DA77220b2217cE0e69248319Bf545e4 src/lockdrop.sol:LockDrop --etherscan-api-key ${AURORA_API_KEY} --verifier blockscout --verifier-url ${AURORA_API} --compiler-version v0.8.23+commit.f704f362 --private-key ${PRIVATE_KEY}



// 1:  Arbitrum Sepolia
// forge verify-contract --chain-id 421614 --num-of-optimizations 1000000 --watch --compiler-version v0.8.19+commit.4fc1097e 0x5912a392035116C62A40a400e3F54E4523227420 src/lockdrop.sol:LockDrop

// forge verify-contract --chain-id 421614 --num-of-optimizations 1000000 --watch --compiler-version v0.8.23+commit.f704f362 0x7a6b0c0731Bba1c6c74bDEE6AA2eA6C48CB51087 src/simple.sol:SimpleToken --etherscan-api-key ${ARBISCAN_API_KEY} --verifier-url ${ARBITRUM_SEPOLIA_API}

// 2:  Aurora Testnet
// forge verify-contract --chain-id 1313161555 --num-of-optimizations 1000000 --watch --compiler-version v0.8.23+commit.f704f362  0x7a6b0c0731Bba1c6c74bDEE6AA2eA6C48CB51087 src/lockdrop.sol:LockDrop --etherscan-api-key ${AURORA_API_KEY} --verifier-url ${AURORA_API} 




// WORKS - Aurora 


// forge script script/deploy_lockdrop.s.sol:Deploy --rpc-url ${AURORA_TEST_RPC_URL} --broadcast --legacy --private-key ${PRIVATE_KEY}

// forge script script/deploy_simple.s.sol:DeploySimple
// forge script script/deploy_simple.s.sol:DeploySimple --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv

// forge create --rpc-url INSERT_RPC_API_ENDPOINT \
// --constructor-args 100 \
// --private-key INSERT_YOUR_PRIVATE_KEY \
// src/MyToken.sol:MyToken

// forge create src/simple.sol:SimpleToken --private-key $PRIVATE_KEY --rpc-url $SEPOLIA_RPC_URL --verify      <-- success
//
// forge create src/simple.sol:SimpleToken --private-key $PRIVATE_KEY --rpc-url $AURORA_TEST_RPC_URL           <-- fail
// forge create src/simple.sol:SimpleToken --private-key $PRIVATE_KEY --rpc-url $AURORA_TEST_RPC_URL --legacy  <-- success
//      --legacy --verify       <-- fail

// forge create --rpc-url $SEPOLIA_RPC_URL \
// --private-key $PRIVATE_KEY \
// --etherscan-api-key $ETHERSCAN_API_KEY \
// --verify \
// src/simple.sol:SimpleToken

// forge create --rpc-url $AURORA_TEST_RPC_URL \
// --private-key $PRIVATE_KEY \
// --verify \
// src/simple.sol:SimpleToken

// forge flatten --output src/simple.flattened.sol src/simple.sol

// forge verify-contract --chain-id 1313161555 --num-of-optimizations 1000000 --watch \
//     --compiler-version v0.8.22+commit.4fc1097e \
//     <the_contract_address> \
//     src/simple.sol:SimpleToken

// forge verify-contract --chain-id 11155111 --num-of-optimizations 1000000 --watch --compiler-version v0.8.22+commit.4fc1097e 0x5912a392035116C62A40a400e3F54E4523227420 src/lockdrop.sol:LockDrop

// forge verify-contract --chain-id 1313161555 --num-of-optimizations 1000000 --watch --compiler-version v0.8.22+commit.4fc1097e 0x5912a392035116C62A40a400e3F54E4523227420 src/lockdrop.sol:LockDrop

// forge verify-contract --chain-id 11155111 --num-of-optimizations 1000000 --watch --compiler-version v0.8.13+commit.abaa5c0e 0xE502649999431584710147eAeA097c941cc9Ee8C src/lockdrop.sol:Counter
