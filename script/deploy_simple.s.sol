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

// forge create src/simple.sol:SimpleToken --private-key $PRIVATE_KEY --rpc-url $SEPOLIA_RPC_URL
// forge create src/simple.sol:SimpleToken --private-key $PRIVATE_KEY --rpc-url $AURORA_TEST_RPC_URL

// forge create --rpc-url INSERT_RPC_API_ENDPOINT \
// --constructor-args 100 \
// --private-key INSERT_YOUR_PRIVATE_KEY \
// src/MyToken.sol:MyToken


// forge create --rpc-url https://rpc2.sepolia.org \
// --private-key b4a2e3f0d67722c2ef7e95e688e360708fb74e65c5932828e6e499b4adcfc525 \
// --etherscan-api-key K47TR45ZRI8MM5ZTDJAXQVXN9IRTEVHFMB \
// --verify \
// src/simple.sol:SimpleToken


// forge create --rpc-url https://testnet.aurora.dev \
// --private-key b4a2e3f0d67722c2ef7e95e688e360708fb74e65c5932828e6e499b4adcfc525 \
// --verify \
// src/simple.sol:SimpleToken

