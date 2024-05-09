// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IVRFv2Consumer {
    function lastRequestId() external view returns (uint256);
    function requestRandomWords() external returns (uint256 requestId);
    function getRequestStatus(uint256 _requestId) external returns (bool fulfilled, uint256[] memory randomWords);
    function setLotteryContract(address _lotterycontract) external;
}
