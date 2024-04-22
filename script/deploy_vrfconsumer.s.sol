// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {VRFv2Consumer} from "../src/vrfv2consumer.sol";  
import {IVRFv2Consumer} from "../src/I.vrfv2consumer.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        // uint256 supply = 1_000 * (10 ** 18);
        uint64 subscriptionId = 10258;                               // Chainlink Subscription ID
        address randomnumbergenerator = 0xf91CEE8470186c1e17F7e4b2cC14a0090759dE02;

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy VRFv2Consumer contract
        new VRFv2Consumer(subscriptionId, randomnumbergenerator);

        // call requestRandomWords()
        // IVRFv2Consumer(vrfConsumer).requestRandomWords();   

        vm.stopBroadcast();
    }
}

// deploy
// forge script script/deploy_vrfconsumer.s.sol:Deploy --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast --verify -vv --etherscan-api-key ${ETHERSCAN_API_KEY}

// use
// forge script script/deploy_vrfconsumer.s.sol:Deploy --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast

