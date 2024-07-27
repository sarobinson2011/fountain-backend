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
        uint256 supply = 1_000 * (10**18);
        // uint256 currentReward = 0;

        address tokenmanagerAddress = 0xAfb04620B1BFAC4a59d141FDe8C79B3B075f79B0;

        // address lockdrop = ;

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy reward token manager
        // new TokenManager();

        // deploy the FTN token contract
        // new Reward("Frountain", "FTN", tokenmanagerAddress, supply);
        
        // deploy lockdrop
        new LockDrop(tokenmanagerAddress); 

        // call returnBlockReward
        // currentReward = ILockDrop(lockdrop).returnBlockReward();
        // console.log("Current Reward amount:", currentReward);

        // stop broadcast
        vm.stopBroadcast();
    }
}

