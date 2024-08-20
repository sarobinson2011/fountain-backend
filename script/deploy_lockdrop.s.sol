// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/reward.sol";
import {LockDrop} from "../src/lockdrop.sol";
import {ILockDrop} from "../src/I.lockdrop.sol";
import {TokenManager} from "../src/rewardtokenmanager.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        // uint256 supply = 1_000 * (10**18);

        address tokenmanagerAddress = 0x7aedE1ceF21bF80574aD9339c63745Ef138219C6;
        // address reward = 0xB688bbAF1239b560eCd6B56d7fAd4719D75CB7e1;
        // address lockdrop = 0xA19d215f9f580B12F2A9979CF4aE6a177018e7AF;

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy reward token manager
        // new TokenManager();

        // deploy the FTN token contract
        // new Reward("Fountain", "FTN", tokenmanagerAddress, supply);
        
        // set Reward Token Address (in TokenManager) 
        // ITokenManager(tokenmanagerAddress).setRewardTokenAddress(reward);

        // deploy lockdrop
        new LockDrop(tokenmanagerAddress); 

        // call fetchBlockReward
        // ILockDrop(lockdrop).fetchBlockReward();

        // stop broadcast
        vm.stopBroadcast();
    }
}

