// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy the Counter contract
        new Counter();

        // stop broadcast
        vm.stopBroadcast();
    }
}
