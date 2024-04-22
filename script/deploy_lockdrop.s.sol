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
        // uint256 supply = 1_000 * (10 ** 18);

        address vrfConsumer = 0xF81850c6A9CeE8eb9693dBa43D042379dd3384DB;
        address randomnumbergenerator = 0xf91CEE8470186c1e17F7e4b2cC14a0090759dE02; 
        address tokenmanagerAddress =   0x0f741C46DF0b919C9251e0A5d027de534d273369;
        // address rewardAddress =   0x27346f96D479C15889eCB07CeCbFeaD536E9AF52;

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


