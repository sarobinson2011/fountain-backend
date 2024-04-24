// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {RandomNumberGenerator} from "../src/randomnumbergenerator.sol";
import {IRandomNumberGenerator} from "../src/I.randomnumbergenerator.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        // address vrfConsumer = ;
        // address randomnumbergenerator = ;   

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // 0b.  deploy RandomNumberGenerator contract 
        new RandomNumberGenerator();

        vm.stopBroadcast();
    }
} 

                                    

// deploy
// forge script script/deploy_vrfconsumer.s.sol:Deploy --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast --verify -vv --etherscan-api-key ${ETHERSCAN_API_KEY}

// use
// forge script script/deploy_vrfconsumer.s.sol:Deploy --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast

// forge script script/deploy_eventListener.s.sol:Deploy --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast --verify -vv --etherscan-api-key ${ETHERSCAN_API_KEY}