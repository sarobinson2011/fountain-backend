// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IRandomNumberGenerator {
    function requestRandomWords() external;
    function getRequestStatus() external returns (bool fulfilled, uint256[] memory randomWords);
    function randomNumGenerator() external 
        returns (uint256);  
}



// This functions returns the random number given to us by chainlink

    // function randomNumGenerator() public view returns (uint256) {
    //     //    uint256 requestID = getRequestId();
    //     uint256 requestID = vrfv2consumer.lastRequestId();
    //     // Get random words array
    //     (, uint256[] memory randomWords) = vrfv2consumer.getRequestStatus(requestID);

    //     // return first random word
    //     return randomWords[0];
    // }


