// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/reward.sol";
import {LockDrop} from "../src/lockdrop.sol";
import {ILockDrop} from "../src/I.lockdrop.sol";
import {IRandomNumberGenerator} from "../src/I.randomnumbergenerator.sol";
import {IVRFv2Consumer} from "../src/I.vrfv2consumer.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        // uint256 amount = 15 * (10**18);

        address lockdrop = 0xF23d5eD9b01F337391F41D8E837888f577D9c0Ca;
        // address tokenmanager = 0xc2b04B6015051bDffAF9542b7f4De4fa30d26d52;
        // address reward = 0xCe5fDEb82519D6fa20eFb17cc59eDcA8117647b2;
   
        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);

        // call setVrfConsumer()
        // IRandomNumberGenerator(randomnumbergenerator).setVrfConsumer(vrfconsumer);

        // call VRFv2Consumer:setLockdropAddress(LockDrop)
        // IVRFv2Consumer(vrfconsumer).setLockdropAddress(lockdrop);

        // call setRewardTokenAddress()
        // ITokenManager(tokenmanager).setRewardTokenAddress(reward);

        // deposit
        // ILockDrop(lockdrop).deposit{value: 0.0001 ether}();    
    
        // withdraw funds + random reward
        ILockDrop(lockdrop).withdraw();

        // set the VRF consumer address in the Random Number Genrator
        // IRandomNumberGenerator(randomnumbergenerator).setVrfConsumer(vrfconsumer);  

        // stop broadcast
        vm.stopBroadcast();
    }
}   

// 1. deploy TokenManager contract                                    -     yes
// 2. deploy Reward contract                                          -     yes
// 3. call TokenManager:setRewardTokenAddress()                       -     yes
// 4. deploy LockDrop (tokenManagerAddress)                           -     yes
// 5. call LockDrop.deposit()                                         -     yes  
// 6. call LockDrop.withdraw()                                        -     no   <--- 

// TokenManager: 0xc2b04B6015051bDffAF9542b7f4De4fa30d26d52
// LockDrop: 0xF23d5eD9b01F337391F41D8E837888f577D9c0Ca
// Reward: 0xCe5fDEb82519D6fa20eFb17cc59eDcA8117647b2                 (986 left)

