// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IEventListener {
    function requestRandomWords() external;
    function getRequestStatus() external returns (bool fulfilled, uint256[] memory randomWords);
    function randomNumGenerator() external 
        returns (uint256);   // <-- this is the only bit you need from eventInterface.sol
}

//  need to include the randomNumberGenerator() function (as above) in randomNumberGenerator.sol 