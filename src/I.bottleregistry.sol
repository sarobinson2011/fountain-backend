// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IRegistry {
    function registerBottle(string memory _rfid,
        bytes32 _authentictyHash,
        address _bottleOwner,
        string memory _tokenURI) external;
    function getBottle(string memory _rfid) external returns(string memory, bytes32, address);
    function setContractNFT(address _NFTcontract) external;
}
