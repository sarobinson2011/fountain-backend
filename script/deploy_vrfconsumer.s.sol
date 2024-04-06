// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {VRFv2Consumer} from "../src/randomNumberGenerator.sol";  


contract DeployVRFConsumer is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        uint256 supply = 1_000 * (10 ** 18);
        uint64 subscriptionId = 0;

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy VRFv2Consumer contract
        VRFv2Consumer vrfv2consumer = new VRFv2Consumer(subscriptionId);

        vm.stopBroadcast();
    }
}

