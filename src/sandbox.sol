// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {VRFv2Consumer} from "../src/randomNumberGenerator.sol";


contract EventListener {
    // blah
    VRFv2Consumer public vrfv2consumer;

    constructor(address _vrfConsumerAddress) {
        vrfv2consumer = VRFv2Consumer(_vrfConsumerAddress);
    }

    function listenToEvent() external {
        // Subscribe to the event
        VRFv2Consumer(vrfv2consumer).RequestFulfilled(0, new uint256 );     // <-- HERE !!
    }

}


