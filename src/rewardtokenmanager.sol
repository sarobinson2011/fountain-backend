// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract TokenManager {
    address public rewardTokenAddress;
    address public owner;
    event RewardTransferred(address indexed _user, uint256 _amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier addressIsNotZero() {
        require(rewardTokenAddress != address(0), "Address is zero, not allowed for ERC20 transfers");
        _;
    }

    function setRewardTokenAddress(address _rewardTokenAddress) public onlyOwner {
        rewardTokenAddress = _rewardTokenAddress;
    }

    function transferReward(address _to, uint256 _amount) public addressIsNotZero {
        (bool success, ) = rewardTokenAddress.call(abi.encodeWithSignature("transferReward(address,uint256)",_to,_amount));
        require(success, "RWDZ token transfer failed...");
        emit RewardTransferred(msg.sender, _amount);              
    }
}

