// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IVRFv2Consumer} from "../src/I.vrfv2consumer.sol";


contract RandomNumberGenerator {
    address public owner;
    address public vrfv2consumer;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function setVrfConsumer(address _vrfConsumerAddress) public onlyOwner {
        vrfv2consumer = _vrfConsumerAddress;
    }

    function requestRandomWords() public {
        IVRFv2Consumer(vrfv2consumer).requestRandomWords();   
    }

    function getRequestStatus()
        public
        returns (bool fulfilled, uint256[] memory randomWords)
    {
        uint256 requestID = IVRFv2Consumer(vrfv2consumer).lastRequestId();
        (fulfilled, randomWords) = IVRFv2Consumer(vrfv2consumer).getRequestStatus(requestID);
    }

    function randomNumGenerator() public returns (uint256) {
        uint256 requestID = IVRFv2Consumer(vrfv2consumer).lastRequestId();
        (, uint256[] memory randomWords) = IVRFv2Consumer(vrfv2consumer).getRequestStatus(requestID);
        return randomWords[0];
    }
}

