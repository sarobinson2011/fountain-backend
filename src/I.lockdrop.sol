// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface ILockDrop {
    function owner() external;
    function deposit(uint256 _amount) external payable;
    function withdraw() external;
    function calculateReward() external returns(uint256); 
    function fetchBlockReward() external returns(uint256);
}

