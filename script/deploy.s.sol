// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/reward.sol";
import {TokenManager} from "../src/rewardtokenmanager.sol";

contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        uint256 supply = 1_000 * (10 ** 18);

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy TokenManager
        TokenManager tokenmanager = new TokenManager();

        // deploy the token contract
        new Reward("Rewardz", "RWDZ", address(tokenmanager), supply);

        // deposit ether
        // lockdrop.deposit{value: 0.01 ether}();

        // stop broadcast
        vm.stopBroadcast();
    }
}



