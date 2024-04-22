// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/tokencontract.sol";
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
        address lockdrop =  0x7c9D25AD8C5e948087d74654c230249E9C353Cd8;
        address vrfconsumer = 0xF81850c6A9CeE8eb9693dBa43D042379dd3384DB;
        address tokenmanager = 0x0f741C46DF0b919C9251e0A5d027de534d273369;
        address reward = 0x27346f96D479C15889eCB07CeCbFeaD536E9AF52;
        // address randomnumbergenerator = 0xf91CEE8470186c1e17F7e4b2cC14a0090759dE02;

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

// 1. deploy RandomNumberGenerator                                              - yes
// 2. deploy VRFv2Consumer contract (subscriptionId, randomnumbergenerator)     - yes
// 3. call setVrfConsumer(address(RandomNumberGenerator))                       - yes
// 3. deploy TokenManager contract                                              - yes
// 4. call TokenManager:setRewardTokenAddress()                                 - yes
// 4. deploy LockDrop (tokenmanager, vrfconsumer, randomnumbergenerator)        - yes
// 5. call VRFv2Consumer:setLockdropAddress(LockDrop)                           - yes
// 6. Reward = reward;                                                          - yes
// 7. call LockDrop.deposit()                                                   - yes
// 8. call LockDrop.withdraw()                                                  - no  <--


// RandomNumberGenerator: 0xf91CEE8470186c1e17F7e4b2cC14a0090759dE02
// VRFv2Consumer: 0xF81850c6A9CeE8eb9693dBa43D042379dd3384DB
// TokenManager: 0x0f741C46DF0b919C9251e0A5d027de534d273369     
// LockDrop: 0x7c9D25AD8C5e948087d74654c230249E9C353Cd8
// Reward: 0x27346f96D479C15889eCB07CeCbFeaD536E9AF52                   (660 left)