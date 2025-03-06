// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {BottleNFT} from "../src/bottleNFT.sol";
import {IBottleNFT} from "../src/I.bottleNFT.sol";

contract Registry {
    
    struct Bottle {
        string rfid;
        bytes32 authenticityHash;
        address bottleOwner;
        bool exists;
    }
    
    address public admin;
    address public NFTContract;
    
    mapping(string => Bottle) public bottles;             // bottle storage via a mapping

    event BottleRegistered(string _rfid, bytes32 _authentictyHash, address _bottleOwner);
    event GetBottleDetails(string _rfid, bytes32 _authentictyHash, address _bottleOwner);
    
    modifier onlyAdmin() {
        require(msg.sender == admin);
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function setContractNFT(address _NFTcontract) external onlyAdmin {
        NFTContract = _NFTcontract;                              // new - all needs re-deploying  #ToDo
    }

    function registerBottle(
        string memory _rfid,
        bytes32 _authentictyHash,
        address _bottleOwner,
        string memory _tokenURI
    ) external onlyAdmin {
        require(!bottles[_rfid].exists, "Bottle RFID has already registered");
        
        bottles[_rfid] = Bottle({
            rfid: _rfid,
            authenticityHash: _authentictyHash,
            bottleOwner: _bottleOwner,
            exists: true
        });
        emit BottleRegistered(_rfid, _authentictyHash, _bottleOwner);   
        IBottleNFT(NFTContract).mintNFT(_bottleOwner, _tokenURI);           // mint the NFT test  #ToDo
    } 


    function getBottle(string memory _rfid) external onlyAdmin returns (string memory, bytes32, address) {
        require(bottles[_rfid].exists, "Bottle not found");

        Bottle memory bottle = bottles[_rfid];

        emit GetBottleDetails(bottle.rfid, bottle.authenticityHash, bottle.bottleOwner);
        return (bottle.rfid, bottle.authenticityHash, bottle.bottleOwner);
    }
}
