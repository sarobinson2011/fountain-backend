// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {TokenManager} from "../src/rewardtokenmanager.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);

        console.log("Account:", account);

    
        vm.startBroadcast(privateKey);

        // deploy new TokenManager contract
        new TokenManager();                     //  <-- get this working HERE !!
        
        vm.stopBroadcast();
    }
} 
