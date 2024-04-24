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

        address vrfConsumer = 0xED944B2A0298c4872615680b336f5b340FE2eCBD;
        address randomnumbergenerator = 0xC793D13E7878feF765305375Cf6f38e0130C411c; 
        address tokenmanagerAddress = 0x67a3adfe456c8B4bf20c667768ACC9F18b159972;
        // address rewardAddress = 0x802560a926b63C75111a94bB0f818790113a7f37;

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy reward token manager
        // TokenManager tokenmanager = new TokenManager();

        // deploy the RWDZ token contract
        // new Reward("Rewardz", "RWDZ", tokenmanagerAddress, supply);
        
        // set the Reward token address in TokenManager
        // ITokenManager(address(tokenmanager)).setRewardTokenAddress(address(reward));
        // ITokenManager(tokenmanagerAddress).setRewardTokenAddress(rewardAddress);
        
        // deploy lockdrop
        new LockDrop(tokenmanagerAddress, vrfConsumer, randomnumbergenerator);

        // stop broadcast
        vm.stopBroadcast();
    }
}


