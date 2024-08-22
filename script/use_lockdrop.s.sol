// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/reward.sol";
import {LockDrop} from "../src/lockdrop.sol";
import {ILockDrop} from "../src/I.lockdrop.sol";
import {IRandomNumberGenerator} from "../src/I.randomnumbergenerator.sol";
import {IVRFv2Consumer} from "../src/I.vrfv2consumer.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        // uint256 amount = 15 * (10**18);
        uint256 blockReward = 0;

        address lockdrop = 0x8EF66EF1D1988aCe7E557CDE98f67Fb3c18Cd2D2;
        address tokenmanager = 0x7aedE1ceF21bF80574aD9339c63745Ef138219C6;
        address reward = 0xB688bbAF1239b560eCd6B56d7fAd4719D75CB7e1;
   
        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);


        // ===========  Lottery  ===========

        // Set VRF Consumer
        // IRandomNumberGenerator(randomnumbergenerator).setVrfConsumer(vrfconsumer);

        // Set Lockdrop Address 
        // IVRFv2Consumer(vrfconsumer).setLockdropAddress(lockdrop);

        // set the VRF consumer address in the Random Number Genrator
        // IRandomNumberGenerator(randomnumbergenerator).setVrfConsumer(vrfconsumer);


        // ===========  LockDrop  ==========

        // 1/. DEPOSIT
        // ILockDrop(lockdrop).deposit{value: 0.0001 ether}();    
    
        // 2/. WITHDRAW 
        // ILockDrop(lockdrop).withdraw();

        // 3/. call fetchBlockReward
        blockReward = ILockDrop(lockdrop).fetchBlockReward();
        console.log("FTN token reward: ", blockReward);


        // stop broadcast
        vm.stopBroadcast();
    }
}   
