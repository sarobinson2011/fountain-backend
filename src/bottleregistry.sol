// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Registry {
    
    struct Bottle {
        string rfid;
        bytes32 authenticityHash;
        address bottleOwner;
        bool exists;
    }
    
    address public admin;
    
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

    function registerBottle(
        string memory _rfid,
        bytes32 _authentictyHash,
        address _bottleOwner
    ) external onlyAdmin {
        require(!bottles[_rfid].exists, "Bottle already registered :-)");
        
        bottles[_rfid] = Bottle({
            rfid: _rfid,
            authenticityHash: _authentictyHash,
            bottleOwner: _bottleOwner,
            exists: true
        });
        emit BottleRegistered(_rfid, _authentictyHash, _bottleOwner);    
    } 


    function getBottle(string memory _rfid) external onlyAdmin returns (string memory, bytes32, address) {
        require(bottles[_rfid].exists, "Bottle not found");

        Bottle memory bottle = bottles[_rfid];

        emit GetBottleDetails(bottle.rfid, bottle.authenticityHash, bottle.bottleOwner);
        return (bottle.rfid, bottle.authenticityHash, bottle.bottleOwner);
    }
}
