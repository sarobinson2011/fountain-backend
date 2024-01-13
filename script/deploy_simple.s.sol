// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.22;

//
// Learn to deploy via this script (on top of 'forge create')
//

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {SimpleToken} from "../src/simple.sol";

contract DeploySimple is Script {
    
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);

        console.log("Account:", account);

        vm.startBroadcast(privateKey);
        // deploy token
        new SimpleToken("STOKEN", "STK");
        // mint ?
        vm.stopBroadcast();
    }
}

// source .env

// forge script script/deploy_simple.s.sol:DeploySimple

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

// forge verify-contract --chain-id 1313161555 --num-of-optimizations 1000000 --watch --compiler-version v0.8.22+commit.4fc1097e 0xB864c40A6F9d20B9500f14f239862899ea8aC772 src/simple.sol:SimpleToken
