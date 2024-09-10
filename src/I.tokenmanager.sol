// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface ITokenManager {
    function setRewardTokenAddress(address _rewardTokenAddress) external;
    function setLockDropAddress(address _lockdropAddress) external;
    function transferReward(address _to, uint256 _amount) external;
}


