// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol"; 
import {Script, console2} from "forge-std/Script.sol";
import {Registry} from "../src/bottleregistry.sol";
import {IRegistry} from "../src/I.bottleregistry.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        address account2 = 0xC26741bac14a3Ba52517D6fD825eF4513454178E;

        address bottleRegistry = 0x164Fe267051086256973c6561e01C83B10FCBbb8;

        string memory _rfid = "000000000000001";
        bytes32 _authenticityHash = 0xd26fe0985dfb6da664b3c62f4ae07e0f307c9f212a10f760f28cdfa5a571d0aa;

        string memory bottleId;
        bytes32 bottleHash;
        address bottleOwner;

        // console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);
        
        // new Registry();    

        // IRegistry(bottleRegistry).registerBottle(_rfid, _authenticityHash, account);
        
        (bottleId, bottleHash, bottleOwner) = IRegistry(bottleRegistry).getBottle(_rfid);
        console2.log("bottleOwner:", bottleOwner);
        
        console2.log("bottleHash:");
        console2.logBytes32(bottleHash);
        
        console2.log("bottleId:");
        console2.logString(bottleId);


        // stop broadcast
        vm.stopBroadcast();
    }
}




