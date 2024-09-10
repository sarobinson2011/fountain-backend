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

        address tokenmanagerAddress = 0x6fA792653BDf612B12156781142020952585fDDD;
        address reward = 0x990c4cDACEd8CcEcD158BB940C029A37f08a6cc8;
        address lockdrop = 0xb3E84f2D80246eEB6677F69f391Ca5FCd6A70cA0;

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

