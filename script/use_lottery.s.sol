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

        address lottery = 0x0818477A1FBC549f449605F627971B87b599AE28;
        address vrfconsumer = 0xA3838100aDC629874C864A9F49D3191EC8Cc3F35;
        address tokenManager = 0x50eF9E70dA285ee6321F765997FCd294f0805d36;
   
        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);


        // 1. Deploy VRFv2Consumer contract
        // new VRFv2Consumer(subscriptionId);

        // 2. Deploy Lottery contract
        // new Lottery(entryFee, maxPlayers);
        
        // 3. Set vrfconsumer address (in Lottery contract)
        // ILottery(lottery).setVrfConsumer(vrfconsumer);

        // x. Set tokenmanager address (in Lottery contract)
        // ILottery(lottery).setTokenManager(tokenManager);

        // 4. Set lottery address (in VRFv2Consumer contract)
        // IVRFv2Consumer(vrfconsumer).setLotteryContract(lottery);

        // 5. Set TokenManager / VRFv2Consumer addresses (in Lottery)
        // ILottery(lottery).setTokenManager(tokenManager);
        // ILottery(lottery).setVrfConsumer(vrfconsumer);

        // 6. call Lottery:returnWinner()                              
        // address winner = ILottery(lottery).returnWinner();
        // console.log("Current lottery winner: ", winner);

        // 7. join the lottery (using 2 accounts)
        ILottery(lottery).joinLottery{value: entryFee}();           // do this next !!!

        // 8. Reset the lottery
        // ILottery(lottery).resetLottery();


        // stop broadcast
        vm.stopBroadcast();
    }
}

