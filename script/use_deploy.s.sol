// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/tokencontract.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";


contract Use is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        address me = 0xF8f8269488f73fab3935555FCDdD6035699deE25;
        address reward = 0x3022F88b83021746672f338e9Ce003ae6c0b43D7;
        address tokenmanager = 0xb136843F392dd2f174063ee469a875F642444146; // deployed lockdrop address
        uint256 amount = 100 * (10 ** 18);

        console.log("Account:", account);
        // start broadcast
        vm.startBroadcast(privateKey);
        
        // ILockDrop(lockdrop).deposit{value: 0.1 ether}(); 
        // ITokenManager(tokenmanager).setRewardTokenAddress(reward);
        ITokenManager(tokenmanager).transferReward(me, amount);
        
        // stop broadcast
        vm.stopBroadcast();
    }
}

