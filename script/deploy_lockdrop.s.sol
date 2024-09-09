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

        address tokenmanagerAddress = 0x6e504AADD0CaB5859EaC96ce3C2aA4f0c6e22C05;
        address reward = 0x835aC05C80A15b7D0260f10B0E05298FABc8d941;
        address lockdrop = 0xBfce06e08210eA7D521CC8B268c98F3103D291ff;

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

