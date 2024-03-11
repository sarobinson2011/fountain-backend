// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/vrf/VRFConsumerBase.sol";


contract RandomNumberGenerator is VRFConsumerBase {
    bytes32 internal keyHash;
    uint256 internal fee;
    uint256 public randomResult;

    // Chainlink VRF parameters
    constructor(address _vrfCoordinator, address _linkToken, bytes32 _keyHash, uint256 _fee)
        VRFConsumerBase(_vrfCoordinator, _linkToken)
    {
        keyHash = _keyHash;
        fee = _fee; // Fee is specified in LINK (Chainlink token)
    }

    function requestRandomNumber() external returns (bytes32 requestId) {
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK tokens");

        // Making the request to Chainlink VRF
        requestId = requestRandomness(keyHash, fee);
        return requestId;
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomResult = (randomness % 20) + 1; // Get a random number between 1 and 20
        requestId = requestId;
        // You can now use 'randomResult' as your random number
    }
}

