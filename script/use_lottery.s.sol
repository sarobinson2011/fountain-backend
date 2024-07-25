// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {VRFv2Consumer} from "../src/vrfv2consumer.sol";
import {IVRFv2Consumer} from "../src/I.vrfv2consumer.sol";
import {Lottery} from "../src/lottery.sol";
import {ILottery} from "../src/I.lottery.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";
import {Reward} from "../src/reward.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);

        uint64 subscriptionId = 10258;
        uint256 entryFee = 0.001 * (10**18);
        uint256 maxPlayers = 2;
        uint256 supply = 1_000 * (10**18);

        // uint256 requestId = 0;
        address rewardz = 0x1645422d1f02fc09CcA7af48ea30cA2bF5F4F25E;
        address tokenManager = 0x19c68c600CB47b53e9609DE123bccc2E40A9B880;

        // uint256 randomWord = 0xe88cb090918292ae8a2ca83cafb44744736b796305ef8b6be7a326b478e5a0ee;

        console.log("Account:", account);
        
        // start broadcast 
        vm.startBroadcast(privateKey);

        // 1. Deploy VRFv2Consumer contract
        // new VRFv2Consumer(subscriptionId);

        // 1a. Deploy Reward token contract
        // new Reward("Rewardz", "RWDZ", address(tokenManager), supply);

        // 2. Deploy Lottery contract
        // new Lottery(entryFee, maxPlayers);
        
        // 3. Set vrfconsumer address (in Lottery contract)
        // ILottery(lottery).setVrfConsumer(vrfconsumer);

        // x. Set tokenmanager address (in Lottery contract)
        // ILottery(lottery).setTokenManager(tokenManager);

        // 4. Set lottery address (in VRFv2Consumer contract)
        // IVRFv2Consumer(vrfconsumer).setLotteryContract(lottery);

        // 4a. Set Reward Token Address (in TokenManager) 
        ITokenManager(tokenManager).setRewardTokenAddress(rewardz);

        // 5. Set TokenManager / VRFv2Consumer addresses (in Lottery)
        // ILottery(lottery).setTokenManager(tokenManager);
        // ILottery(lottery).setVrfConsumer(vrfconsumer);

        // 6. call Lottery:returnWinner()                              
        // address winner = ILottery(lottery).returnWinner();
        // console.log("Current lottery winner: ", winner);

        // 7. join the lottery (using 2 accounts)
        // ILottery(lottery).joinLottery{value: entryFee}();        
 
        // 8. Reset the lottery
        // ILottery(lottery).resetLottery();

        // 9. call getRequestStatus(requestId)
        // bool fulfilled, uint256[] memory randomWords = IVRFv2Consumer(vrfconsumer).getRequestStatus(requestId);

        // 10. console.log the request info
        // console.log("Request fulfilled: ", fulfilled)
        // console.log("Randomness: ", randomWords[0]) 

        // 11. call selectWinner()
        // ILottery(lottery).selectWinner(randomWord); 

        // stop broadcast
        vm.stopBroadcast();
    } 
}


// forge verify-contract --chain-id 11155111 --num-of-optimizations 1000000 --watch --compiler-version v0.8.23+commit.f704f362 0x03a66BB798B1dF87046cC535a8e8489D023212bD src/vrfv2consumer.sol:VRFv2Consumer 

