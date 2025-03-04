// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IRegistry {
    function registerBottle(string memory _rfid,
        bytes32 _authentictyHash,
        address _bottleOwner) external;
    function getBottle(string memory _rfid) external returns(string memory, bytes32, address);
}
