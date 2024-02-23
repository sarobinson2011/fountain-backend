// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/tokencontract.sol";
import {LockDrop} from "../src/lockdrop.sol";
import {ILockDrop} from "../src/I.lockdrop.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        uint256 amount = 10 * (10**18);
        address me = 0xF8f8269488f73fab3935555FCDdD6035699deE25;
        address tokenmanager =  0xE0aA665B625622b7df698B2B1410879A342569F2;
        address reward =  0x7F58730990073Ca415EF52f845823810B4EF8d47;
        address lockdrop =  0x7ffC9a29890E4B86B24560e112dC2Abd749E931f;

        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);

        // ITokenManager(tokenmanager).transferReward(me, amount);
        // ILockDrop(lockdrop).deposit{value: 0.0001 ether}();
        ILockDrop(lockdrop).withdraw();
        
        // stop broadcast
        vm.stopBroadcast();
    }
}

// Arbitrum Sepolia
// forge verify-contract --chain-id 421614 --num-of-optimizations 1000000 --watch --compiler-version v0.8.19+commit.4fc1097e 0x5912a392035116C62A40a400e3F54E4523227420 src/lockdrop.sol:LockDrop

// forge verify-contract --chain-id 421614 --num-of-optimizations 1000000 --watch --compiler-version v0.8.22+commit.4fc1097e 0xD860631A3957656cE86E9227Ae1E6C54763EB757 src/simple.sol:SimpleToken --etherscan-api-key ${ARBISCAN_API_KEY} --verifier-url ${ARBITRUM_SEPOLIA_API}

