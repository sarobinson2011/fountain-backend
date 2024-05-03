// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {IVRFv2Consumer} from "../src/I.vrfv2consumer.sol";
import {ILottery} from "../src/I.lottery.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        // uint256 amount = 15 * (10**18);
   
        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);

        // HERE <-- 

        // stop broadcast
        vm.stopBroadcast();
    }
}   

// 1. deploy VRFv2Consumer                                  - no
// 2. deploy Lottery (max players 2)                        - no
// 3. call VRFv2Consumer:setLotteryContract()               - no
// 4. call Lottery:setVrfConsumer()                         - no   
// 5.   call Lottery:joinLottery()  #1                      - no
// 6.   call Lottery:joinLottery()  #2                      - no
// 7. call Lottery:returnWinner()                               - no    
// 8. call Lottery:selectWinner()                               - no
// 9. call Lottery:returnWinner()                               - no


