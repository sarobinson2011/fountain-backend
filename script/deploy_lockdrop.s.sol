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
        // uint256 supply = 1000 * (10**18);

        address tokenmanagerAddress = 0xc2b04B6015051bDffAF9542b7f4De4fa30d26d52;
        // address rewardAddress = 0xCe5fDEb82519D6fa20eFb17cc59eDcA8117647b2;

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy reward token manager
        // new TokenManager();

        // deploy the RWDZ token contract
        // new Reward("Rewardz", "RWDZ", tokenmanagerAddress, supply);
        
        // deploy lockdrop
        new LockDrop(tokenmanagerAddress);

        // stop broadcast
        vm.stopBroadcast();
    }
}


