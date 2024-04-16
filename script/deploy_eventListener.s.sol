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
        address vrfConsumer = 0xFcb58c9B25B53eDD3f7c230C98C062Eb8a89fd63;
        address randomnumbergenerator = 0x99e7233Bb11224e18D17bD7595Ad9B45862490FC;      // is this needed?                  

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // 0b.  deploy RandomNumberGenerator contract 
        // new RandomNumberGenerator(vrfConsumer);

        // 1.   call requestRandomWords()
        // IRandomNumberGenerator(vrfConsumer).requestRandomWords();   

        // 2.   call getRequestStatus()
        // (bool fulfilled, uint256[] memory randomWords) = IRandomNumberGenerator(randomnumbergenerator).getRequestStatus();
        // console.log("Request fulfilled: ", fulfilled);
        // console.log("Random word: ", randomWords[0]);

        // 3.   call randonNumberGenerator()
        uint256 randomWord = IRandomNumberGenerator(randomnumbergenerator).randomNumGenerator();
        console.log("Random number (VRF): ", randomWord);

        vm.stopBroadcast();
    }
}

// 0a. deploy VRFv2Consumer contract                                                                    - Pre-DONE
// 0b. deploy RandomNumberGenerator(VRFv2Consumer)                                                      - DONE

// 1. IRandomNumberGenerator.requestRandomWords()                                                       - X

// 2. (bool fulfilled, uint256[] memory randomWords) = IRandomNumberGenerator.getRequestStatus()        - X

// 3. uint256 randomWord = RandomNumberGenerator.randonNumberGenerator()                                - X

// 4. console.log("Random number (VRF): ", randomWord);                                                 - X





// deploy
// forge script script/deploy_vrfconsumer.s.sol:Deploy --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast --verify -vv --etherscan-api-key ${ETHERSCAN_API_KEY}

// use
// forge script script/deploy_vrfconsumer.s.sol:Deploy --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast

// forge script script/deploy_eventListener.s.sol:Deploy --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast --verify -vv --etherscan-api-key ${ETHERSCAN_API_KEY}