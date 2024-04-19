// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {TokenManager} from "../src/rewardtokenmanager.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);

        console.log("Account:", account);

    
        vm.startBroadcast(privateKey);

        // deploy new TokenManager contract
        new TokenManager();                     //  <-- get this working HERE !!
        
        vm.stopBroadcast();
    }
} 


// 1. deploy RandomNumberGenerator                                              - yes
// 2. deploy VRFv2Consumer contract (subscriptionId, randomnumbergenerator)     - yes
// 3. call setVrfConsumer(address(RandomNumberGenerator))                       - no !!
// 3. deploy TokenManager contract                                              - yes
// 4. deploy LockDrop (tokenmanager, vrfconsumer, randomnumbergenerator)        - yes
// 5. Reward = reward;                                                          - yes
// 6. call lockdrop.withdraw()


// RandomNumberGenerator: 0x7f7729Bfd9EdBff801640E8047edfF8E3D328eBA
// VRFv2Consumer: 0xB53da4a1c4f1722ab896e9df2b8613eF6d850e24
// TokenManager: 0xcBC9DFEC7A3E052a9D15DaA19e266416f09976E2    
// Reward: 0x27346f96D479C15889eCB07CeCbFeaD536E9AF52
// LockDrop: 0x9DA22906E6c6413257299402Ed0F2618Ff207052

