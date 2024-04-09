// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {VRFv2Consumer} from "../src/randomNumberGenerator.sol";


contract EventListener {
    // blah
    VRFv2Consumer public vrfv2consumer;

    constructor(address _vrfConsumerAddress) {
        vrfv2consumer = VRFv2Consumer(_vrfConsumerAddress);
    }

    // Requests random word(s) from chainlink
    function requestRandomNumber() public {
        vrfv2consumer.requestRandomWords();
    }

    // Need a listener function


    // Verify whether chainlink has returned random words
    function GetRequestStatus()
        public
        view
        returns (bool fulfilled, uint256[] memory randomWords)
    {
        uint256 requestID = vrfv2consumer.lastRequestId();
        (fulfilled, randomWords) = vrfv2consumer.getRequestStatus(
            requestID
        );
    }


    // This functions returns the random number given to us by chainlink
    function randomNumGenerator() public view returns (uint256) {
        //    uint256 requestID = getRequestId();
        uint256 requestID = vrfv2consumer.lastRequestId();
        // Get random words array
        (, uint256[] memory randomWords) = vrfv2consumer.getRequestStatus(requestID);

        // return first random word
        return randomWords[0];
    }
}
