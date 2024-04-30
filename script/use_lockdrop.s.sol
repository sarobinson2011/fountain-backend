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
        address lockdrop =  0xb6C0f728b5fb76aED862E8C602Eb2D8FB520f14C;
        address vrfconsumer = 0xED944B2A0298c4872615680b336f5b340FE2eCBD;
        address tokenmanager = 0x67a3adfe456c8B4bf20c667768ACC9F18b159972;
        address reward = 0x802560a926b63C75111a94bB0f818790113a7f37;
        address randomnumbergenerator = 0xC793D13E7878feF765305375Cf6f38e0130C411c;

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
        // ILockDrop(lockdrop).withdraw();

        // set the VRF consumer address in the Random Number Genrator
        // IRandomNumberGenerator(randomnumbergenerator).setVrfConsumer(vrfconsumer);  

        // stop broadcast
        vm.stopBroadcast();
    }
}   

// 1. deploy RandomNumberGenerator                                    -     no 
// 2. deploy VRFv2Consumer contract ()                                -     no 
// 3. call setVrfConsumer(vrfconsumer)                                -     no

// 4. deploy reward()                                                 -     yes
// 5. deploy TokenManager contract                                    -     yes
// 6. call TokenManager:setRewardTokenAddress()                       -     no
// 7. deploy LockDrop ()                                              -     no 
// 8. call VRFv2Consumer:setLockdropAddress(LockDrop)                 -     no
// 9. add RandomNumberGenerator to the VRF subscription               -     no

// 10. call LockDrop.deposit()                                        -     no 
// 11. call LockDrop.returnRewards()                                  -     no  <-- HERE!
// 12. call LockDrop.withdraw()                                       -     no  


// RandomNumberGenerator: 0xC793D13E7878feF765305375Cf6f38e0130C411c
// VRFv2Consumer: 0xED944B2A0298c4872615680b336f5b340FE2eCBD
// TokenManager:  0x67a3adfe456c8B4bf20c667768ACC9F18b159972    
// LockDrop: 0xb6C0f728b5fb76aED862E8C602Eb2D8FB520f14C
// Reward: 0x802560a926b63C75111a94bB0f818790113a7f37                   (1000 left)

