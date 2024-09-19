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
        uint256 topUpAmount = 100 * (10**18);
        
        uint256 ftnDeposit = 10 * (10**18); 

        address tokenmanager = 0x8823a76dE8387F84Fa0CF4Da2d180d52B36c9F62;
        address reward = 0x5ECFAd467F0D15fdc266772546D1770Ff5b300C3;
        address lockdrop = 0x01518cf209C67e07e0c57fefC079491E2119F6dB;

        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);


        // ===========  Lottery  ===========

        // Set VRF Consumer
        // IRandomNumberGenerator(randomnumbergenerator).setVrfConsumer(vrfconsumer);

        // Set Lockdrop Address 
        // IVRFv2Consumer(vrfconsumer).setLockdropAddress(lockdrop); 


        // ========  TokenManager  =========

        // Set LockDrop address in TokenManager
        // ITokenManager(tokenmanager).setLockDropAddress(lockdrop);


        // ===========  LockDrop  ==========

        // 1a/. DEPOSIT ETH
        // ILockDrop(lockdrop).deposit{value: 0.0001 ether}();    
    
        // 1b/. Top-up with FTN tokens
        // ITokenManager(tokenmanager).topUpFtn(topUpAmount); 

        // 1c/. DEPOSIT FTN
        ILockDrop(lockdrop).deposit(ftnDeposit); 


        // 2/. WITHDRAW 
        // ILockDrop(lockdrop).withdraw();

        // 3/. call fetchBlockReward
        // blockReward = ILockDrop(lockdrop).fetchBlockReward();
        // console.log("FTN token reward: ", blockReward);


        // stop broadcast
        vm.stopBroadcast();
    }
}   
