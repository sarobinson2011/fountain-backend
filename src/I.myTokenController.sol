// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IMyTokenController {
    function setMyTokenAddress(address _myTokenAddress) external;
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function approve(uint256 _amount) external;
    function allowance() external returns (uint256);
    function transferFrom(address _to, uint256 _value) external;
}


