// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/tokencontract.sol";
import {LockDrop} from "../src/lockdrop.sol";
import {ILockDrop} from "../src/I.lockdrop.sol";
import {TokenManager} from "../src/rewardtokenmanager.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        uint256 supply = 1_000 * (10 ** 18);

        address tokenmanagerAddress =   0xdD559d1615BBb1b53cecf2026f0c355c6D760Dbb;
        address rewardAddress =   0x27346f96D479C15889eCB07CeCbFeaD536E9AF52;
        address vrfConsumer = 0xFcb58c9B25B53eDD3f7c230C98C062Eb8a89fd63;
        address randomnumbergenerator = 0x99e7233Bb11224e18D17bD7595Ad9B45862490FC; 

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy reward token manager
        // TokenManager tokenmanager = new TokenManager();

        // deploy the RWDZ token contract
        // Reward reward = new Reward("Rewardz", "RWDZ", address(tokenmanager), supply);
        
        // set the Reward token address in TokenManager
        // ITokenManager(address(tokenmanager)).setRewardTokenAddress(address(reward));
        // ITokenManager(tokenmanagerAddress).setRewardTokenAddress(rewardAddress);
        
        // deploy lockdrop
        new LockDrop(tokenmanagerAddress, vrfConsumer, randomnumbergenerator);

        // stop broadcast
        vm.stopBroadcast();
    }
}

