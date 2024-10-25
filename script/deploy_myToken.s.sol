// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol"; 
import {Script, console2} from "forge-std/Script.sol";
import {MyToken} from "../src/myToken.sol";
import {MyTokenController} from "../src/myTokenController.sol";
import {IMyTokenController} from "../src/I.myTokenController.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        
        address myTokenController = 0xd70E2233705C22CED340F3ae79A4A1c347f5Ad62;
        address myToken = 0x5b230074680177ebca93FccEBf3853536C0FC976;
        address newToken = 0x5bb71c763ef95D99C8803394A1446c1E464bac67;

        address tokenmanager = vm.envAddress("TOKEN_MANAGER_ADDRESS");
        uint256 supply = 1_000_000 * (10**18);
        uint256 amount = 23 * (10**18);

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // new MyTokenController();
        // new MyToken("MyToken", "MYT", myTokenController, supply);
        // new MyToken("NewToken", "NYT", tokenmanager, supply);       // mint to TokenManager

        // IMyTokenController(myTokenController).setMyTokenAddress(myToken);      // #ToDo
        // IMyTokenController(myTokenController).totalSupply();
        IMyTokenController(myTokenController).transfer(account, amount);

        // stop broadcast
        vm.stopBroadcast();
    }
}


// Shaun of the Dead moment  <-----  LOOK   

// re-deploy the contracts
// testt the token vs manager thing (you know)
                                                                                                                                                                                                                                                                  
