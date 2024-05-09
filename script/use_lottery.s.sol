// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {VRFv2Consumer} from "../src/vrfv2consumer.sol";
import {IVRFv2Consumer} from "../src/I.vrfv2consumer.sol";
import {Lottery} from "../src/lottery.sol";
import {ILottery} from "../src/I.lottery.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);

        uint64 subscriptionId = 10258;
        uint256 entryFee = 0.001 * (10**18);
        uint256 maxPlayers = 2;

        address lottery = 0x8BBfD7a9f0ce5BFEEA8D9Cc11Ca05B9eB3399dd7;
        address vrfconsumer = 0xa31e9AA75bD01fa2F12155c85B1dD358ECac9f64;
   
        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);

        // 1. Deploy Lottery contract
        // new Lottery(entryFee, maxPlayers);

        // 2. Deploy VRFv2Consumer contract
        // new VRFv2Consumer(subscriptionId);

        // 3. Set vrfconsumer address (in Lottery contract)
        // ILottery(lottery).setVrfConsumer(vrfconsumer);

        // 4. Set lottery address (in VRFv2Consumer contract)
        // IVRFv2Consumer(vrfconsumer).setLotteryContract(lottery);

        // 5. call Lottery:returnWinner()                               - Pre-Lottery
        address winner = ILottery(lottery).returnWinner();
        console.log("Current lottery winner: ", winner);

        // 6. join the lottery (using 2 accounts)
        // ILottery(lottery).joinLottery();

        // 7. call Lottery:returnWinner()                               - Post-lottery
        // address winner = ILottery(lottery).returnWinner();
        // console.log("Current lottery winner: ", winner);

        // stop broadcast
        vm.stopBroadcast();
    }
}  