// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/tokencontract.sol";
import {LockDrop} from "../src/lockdrop.sol";
import {ILockDrop} from "../src/I.lockdrop.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        uint256 amount = 15 * (10**18);
        address me = 0xF8f8269488f73fab3935555FCDdD6035699deE25;
        
        address tokenmanager =   0xdD559d1615BBb1b53cecf2026f0c355c6D760Dbb;
        // address reward =         0x27346f96D479C15889eCB07CeCbFeaD536E9AF52;
        address lockdrop =       0xAa01BfbB39aFC88F35D18B8ACBa6c09971646923;

        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);

        ITokenManager(tokenmanager).transferReward(me, amount);
        ILockDrop(lockdrop).deposit{value: 0.0001 ether}();
        ILockDrop(lockdrop).withdraw();
        
        // stop broadcast
        vm.stopBroadcast();
    }
}



