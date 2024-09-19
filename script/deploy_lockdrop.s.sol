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
        uint256 supply = 1_000_000 * (10**18);

        address tokenmanager = 0x8823a76dE8387F84Fa0CF4Da2d180d52B36c9F62;
        address reward = 0x5ECFAd467F0D15fdc266772546D1770Ff5b300C3;
        address lockdrop = 0x01518cf209C67e07e0c57fefC079491E2119F6dB;

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy reward token manager
        // new TokenManager();

        // deploy the FTN token contract
        // new Reward("Fountain", "FTN", tokenmanager, supply);
        
        // set Reward Token Address (in TokenManager) 
        // ITokenManager(tokenmanager).setRewardTokenAddress(reward);

        // deploy lockdrop
        new LockDrop(tokenmanager); 

        // call fetchBlockReward
        // ILockDrop(lockdrop).fetchBlockReward();

        // stop broadcast
        vm.stopBroadcast();
    }
}

