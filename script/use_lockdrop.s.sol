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
        address lockdrop =  address(0); //0xB94cef0886aB7F99cF3ccb08c78a66BB71932297 ;

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


// call LockDrop.withdraw()

    // withdraw() steps
    // 5. IRandomNumberGenerator.requestRandomWords()                                                    
    // 6. (bool fulfilled, uint256[] memory randomWords) = IRandomNumberGenerator.getRequestStatus()     
    // 7. uint256 randomWord = RandomNumberGenerator.randonNumberGenerator()                            
// 8. console.log("Random number (VRF): ", randomWords[0]); 


