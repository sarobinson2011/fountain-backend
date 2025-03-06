// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IBottleNFT {
    function mintNFT(address recipient, string memory tokenURI) external;
    function setRegistry(address _registryContract) external;
}


