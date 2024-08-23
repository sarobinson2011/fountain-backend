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
        uint256 supply = 2_000 * (10**18);

        address tokenmanagerAddress = 0xE699e26689E5A1243147e90bA619B480bEc84663;
        address reward = 0x07A8297d53556179448B582b3e939629F5dCC778;
        // address lockdrop = 0x136A1d899c5867a705ff2b28a6Cb4eF08aD87cb7;

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

