// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol"; 
import {Script, console2} from "forge-std/Script.sol";
import {Registry} from "../src/bottleregistry.sol";
import {IRegistry} from "../src/I.bottleregistry.sol";
import {BottleNFT} from "../src/bottleNFT.sol";
import {IBottleNFT} from "../src/I.bottleNFT.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        address account2 = 0xC26741bac14a3Ba52517D6fD825eF4513454178E;

        address bottleRegistry = 0x7fF2c6bb8C835D0458e94c6A2B02C026Ef9fd91C;   // <-- set this #ToDo
        address contractNFT = 0x26F3F5B20785b4D1B8811EEb7ABE8ed2667C537A;      // <-- set this #ToDo

        string memory _rfid = "000000000000001";
        bytes32 _authenticityHash = 0xd26fe0985dfb6da664b3c62f4ae07e0f307c9f212a10f760f28cdfa5a571d0aa;
        string memory bottleImage = "ipfs://QmWJP1Es4gUWHso6yT5pLZTDfY4grssSbQ5Gd12Qcg4zFw";
        string memory tokenURI = "ipfs://QmVUtkyKPHZa6qSvTGNYotUMfPU56VRg1hzqFuUn9ZuLFH";

        string memory name = "Whiskey by Steve";
        string memory symbol = "WbS";
        

        // console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);
        
        // new Registry();    
        // new BottleNFT(name, symbol);

    
        // IBottleNFT(contractNFT).setRegistry(bottleRegistry);
        // IRegistry(bottleRegistry).setContractNFT(contractNFT);

        IRegistry(bottleRegistry).registerBottle(_rfid, _authenticityHash, account, tokenURI);
        

        // (bottleId, bottleHash, bottleOwner) = IRegistry(bottleRegistry).getBottle(_rfid);
        // console2.log("bottleOwner:", bottleOwner);
        
        // console2.log("bottleHash:");
        // console2.logBytes32(bottleHash);
        
        // console2.log("bottleId:");
        // console2.logString(bottleId);


        // stop broadcast
        vm.stopBroadcast();
    }
}




