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
        // uint256 supply = 1_000 * (10 ** 18);
        uint64 subscriptionId = 10258;                                      // Chainlink Subscription ID
        address vrfConsumer = 0xFcb58c9B25B53eDD3f7c230C98C062Eb8a89fd63;
        address randomnumbergenerator = 0x99e7233Bb11224e18D17bD7595Ad9B45862490FC;                        

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy RandomNumberGenerator contract - passing the vrfconsumer to the constructor
        new RandomNumberGenerator(vrfConsumer);

        // call requestRandomWords()
        // IRandomNumberGenerator(vrfConsumer).requestRandomWords();   

        vm.stopBroadcast();
    }
}

// 0a. deploy VRFv2Consumer contract                                                                    - DONE
// 0b. deploy RandomNumberGenerator(VRFv2Consumer)                                                      - DONE

// 1. call IRandomNumberGenerator.requestRandomWords()                                                  - X

// 2. call (bool fulfilled, uint256[] memory randomWords) = IRandomNumberGenerator.getRequestStatus()   - X

// 3. call uint256 randomWord = RandomNumberGenerator.randonNumberGenerator()                           - X

// 4. console.log("Random number (VRF): ", randomWord);                                                 - X





// deploy
// forge script script/deploy_vrfconsumer.s.sol:Deploy --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast --verify -vv --etherscan-api-key ${ETHERSCAN_API_KEY}

// use
// forge script script/deploy_vrfconsumer.s.sol:Deploy --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast

// forge script script/deploy_eventListener.s.sol:Deploy --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast --verify -vv --etherscan-api-key ${ETHERSCAN_API_KEY}