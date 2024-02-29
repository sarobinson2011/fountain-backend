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
        
        address tokenmanager =   0x57187B0Ec2a688D86D713e567D36F2c40fe6537D;
        address reward =         0xC1e775775f5489cFaa8Aad4D226E348b17A06403;
        address lockdrop =       0x43B2cA0BCe07F68E77236cd2d9793f6769c0cd10;

        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);

        // ITokenManager(tokenmanager).transferReward(me, amount);
        // ILockDrop(lockdrop).deposit{value: 0.0001 ether}();
        ILockDrop(lockdrop).withdraw();
        
        // stop broadcast
        vm.stopBroadcast();
    }
}



