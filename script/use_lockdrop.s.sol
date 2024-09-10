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

        address lockdrop = 0xBfce06e08210eA7D521CC8B268c98F3103D291ff;
        address tokenmanager = 0x6e504AADD0CaB5859EaC96ce3C2aA4f0c6e22C05;
        address reward = 0x835aC05C80A15b7D0260f10B0E05298FABc8d941;
   
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
        // ILockDrop(lockdrop).deposit{value: 0.0001 ether}();    
    
        // 2/. WITHDRAW 
        ILockDrop(lockdrop).withdraw();

        // 3/. call fetchBlockReward
        // blockReward = ILockDrop(lockdrop).fetchBlockReward();
        // console.log("FTN token reward: ", blockReward);


        // stop broadcast
        vm.stopBroadcast();
    }
}   
