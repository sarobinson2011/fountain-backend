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

        address lockdrop = 0x639E1684c506c56B8bc9B914A3742bCB9196b4F3;
        address tokenmanager = 0x2c3c29a0A7B72d2951a5270d959F7C5C8DeD3cBc;
        address reward = 0x3879d5dA031fB5F7B65Be7d00b5e6e2312D55eaC;
   
        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);


        // ===========  Lottery  ===========

        // Set VRF Consumer
        // IRandomNumberGenerator(randomnumbergenerator).setVrfConsumer(vrfconsumer);

        // Set Lockdrop Address 
        // IVRFv2Consumer(vrfconsumer).setLockdropAddress(lockdrop); 


        // ===========  LockDrop  ==========

        // 1/. DEPOSIT
        ILockDrop(lockdrop).deposit{value: 0.0001 ether}();    
    
        // 2/. WITHDRAW 
        // ILockDrop(lockdrop).withdraw();

        // 3/. call fetchBlockReward
        // blockReward = ILockDrop(lockdrop).fetchBlockReward();
        // console.log("FTN token reward: ", blockReward);


        // stop broadcast
        vm.stopBroadcast();
    }
}   
