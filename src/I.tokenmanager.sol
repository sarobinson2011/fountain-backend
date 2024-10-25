// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface ITokenManager {
    function setRewardTokenAddress(address _rewardTokenAddress) external;
    function setLockDropAddress(address _lockdropAddress) external;
    function transfer(address _to, uint256 _amount) external;
    function approve(address _spender, uint256 _amount) external;
    function allowance(address _owner, address _spender) external returns(uint256);
    function transferFrom(address _from, address _to, uint256 _value) external;
    function balanceOf(address _account) external returns (uint256);
    function totalSupply() external returns (uint256);
    function transferReward(address _to, uint256 _amount) external;
}


