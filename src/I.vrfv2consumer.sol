// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IVRFv2Consumer {
    function requestRandomWords() external;
    function getRequestStatus(uint256 _requestId) external;
}


