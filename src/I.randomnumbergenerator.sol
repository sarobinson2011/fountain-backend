// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IRandomNumberGenerator {
    function requestRandomWords() external;
    function getRequestStatus() external returns (bool fulfilled, uint256[] memory randomWords);
    function randomNumGenerator() external returns (uint256);
    function setVrfConsumer(address _vrfConsumerAddress) external;   
}

