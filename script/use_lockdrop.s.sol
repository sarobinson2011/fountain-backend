// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/tokencontract.sol";
import {LockDrop} from "../src/lockdrop.sol";
import {ILockDrop} from "../src/I.lockdrop.sol";
import {IRandomNumberGenerator} from "../src/I.randomnumbergenerator.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        // uint256 amount = 15 * (10**18);
        address lockdrop =  0x9DA22906E6c6413257299402Ed0F2618Ff207052;
        address vrfconsumer = 0xB53da4a1c4f1722ab896e9df2b8613eF6d850e24;
        address randomnumbergenerator = 0x7f7729Bfd9EdBff801640E8047edfF8E3D328eBA;

        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);

        // deposit
        // ILockDrop(lockdrop).deposit{value: 0.001 ether}();    
    
        // withdraw funds + random reward
        ILockDrop(lockdrop).withdraw();

        // set the VRF consumer address in the Random Number Genrator
        // IRandomNumberGenerator(randomnumbergenerator).setVrfConsumer(vrfconsumer);  // run this  <-- HERE

        // stop broadcast
        vm.stopBroadcast();
    }
}   


