// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.22;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/tokencontract.sol";
import {LockDrop} from "../src/lockdrop.sol";
import {ILockDrop} from "../src/I.lockdrop.sol";

contract DeploySimple is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        address lockdrop = 0xA7E92dA4062f857f3983C4A46eF5B76BBC487419; // deployed lockdrop address

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // call withdraw on the lockdrop contract (already deployed)
        ILockDrop(lockdrop).withdraw();
        // ILockDrop(lockdrop).deposit{value: 0.01 ether}();

        // stop broadcast
        vm.stopBroadcast();
    }
}

// Arbitrum Sepolia
// forge verify-contract --chain-id 421614 --num-of-optimizations 1000000 --watch --compiler-version v0.8.19+commit.4fc1097e 0x5912a392035116C62A40a400e3F54E4523227420 src/lockdrop.sol:LockDrop
