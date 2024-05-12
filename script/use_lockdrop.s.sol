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

        // address lockdrop = ;
        address tokenmanager = 0x50eF9E70dA285ee6321F765997FCd294f0805d36;
        address reward = 0xf45f8cB5A4C2Dc20D2865a1C6751407C4E097c67;
   
        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);

        // call setVrfConsumer()
        // IRandomNumberGenerator(randomnumbergenerator).setVrfConsumer(vrfconsumer);

        // call VRFv2Consumer:setLockdropAddress(LockDrop)
        // IVRFv2Consumer(vrfconsumer).setLockdropAddress(lockdrop);

        // call setRewardTokenAddress()
        ITokenManager(tokenmanager).setRewardTokenAddress(reward);

        // deposit
        // ILockDrop(lockdrop).deposit{value: 0.0001 ether}();    
    
        // withdraw funds + random reward
        // ILockDrop(lockdrop).withdraw();

        // set the VRF consumer address in the Random Number Genrator
        // IRandomNumberGenerator(randomnumbergenerator).setVrfConsumer(vrfconsumer);  

        // stop broadcast
        vm.stopBroadcast();
    }
}   
