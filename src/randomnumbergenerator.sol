// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVRFv2Consumer {
    function lastRequestId() external view returns (uint256);
    function requestRandomWords() external returns (uint256 requestId);
    function getRequestStatus(uint256 _requestId) external returns (bool fulfilled, uint256[] memory randomWords);
}

contract RandomNumberGenerator {
    address public vrfv2consumer;

    constructor(address _vrfConsumerAddress) {
        vrfv2consumer = _vrfConsumerAddress;
    }

    function requestRandomWords() public {
        IVRFv2Consumer(vrfv2consumer).requestRandomWords();   
    }

    // Verify whether chainlink has returned random words
    function getRequestStatus()
        public
        returns (bool fulfilled, uint256[] memory randomWords)
    {
        uint256 requestID = IVRFv2Consumer(vrfv2consumer).lastRequestId();
        (fulfilled, randomWords) = IVRFv2Consumer(vrfv2consumer).getRequestStatus(requestID);
    }

    // Returns the chainlink random number 
    function randomNumGenerator() public returns (uint256) {
        uint256 requestID = IVRFv2Consumer(vrfv2consumer).lastRequestId();
        // Get random words array
        (, uint256[] memory randomWords) = IVRFv2Consumer(vrfv2consumer).getRequestStatus(requestID);
        return randomWords[0];
    }
}