// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.22;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {SimpleToken} from "../src/simple.sol";

contract DeploySimple is Script {
    
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        new SimpleToken();
        vm.stopBroadcast();
    }
}

// source .env


// forge create --rpc-url INSERT_RPC_API_ENDPOINT \
// --constructor-args 100 \
// --private-key INSERT_YOUR_PRIVATE_KEY \
// src/MyToken.sol:MyToken


// forge create src/simple.sol:SimpleToken --private-key $PRIVATE_KEY --rpc-url $SEPOLIA_RPC_URL --verify      <-- success

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

