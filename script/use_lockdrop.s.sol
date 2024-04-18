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
        // uint256 amount = 15 * (10**18);
        
        // address tokenmanager = 0xdD559d1615BBb1b53cecf2026f0c355c6D760Dbb;
        // address reward = 0x27346f96D479C15889eCB07CeCbFeaD536E9AF52;
        // address lockdrop = 0xAa01BfbB39aFC88F35D18B8ACBa6c09971646923;     <-- OLD
        address lockdrop =  0xB94cef0886aB7F99cF3ccb08c78a66BB71932297 ;

        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);

        // deposit
        // ILockDrop(lockdrop).deposit{value: 0.001 ether}();
        
        // withdraw funds + random reward
        ILockDrop(lockdrop).withdraw();
        
        // stop broadcast
        vm.stopBroadcast();
    }
}   


// 0a. deploy VRFv2Consumer contract
// 0b. deploy RandomNumberGenerator(VRFv2Consumer)
// 1. IRandomNumberGenerator.requestRandomWords()                                                    
// 2. (bool fulfilled, uint256[] memory randomWords) = IRandomNumberGenerator.getRequestStatus()     
// 3. uint256 randomWord = RandomNumberGenerator.randonNumberGenerator()                             
// 4. console.log("Random number (VRF): ", randomWord); 

