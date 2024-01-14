// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.22;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/tokencontract.sol";
import {LockDrop} from "../src/lockdrop.sol";
import {ILockDrop} from "../src/Ilockdrop.sol";

contract DeploySimple is Script {
    
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        address lockdrop = 0x5912a392035116C62A40a400e3F54E4523227420;  // deployed lockdrop address     

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);
        
        // call withdraw on the lockdrop contract (already deployed)
        ILockDrop(lockdrop).withdraw();
        
        // stop broadcast
        vm.stopBroadcast();
    }
}


