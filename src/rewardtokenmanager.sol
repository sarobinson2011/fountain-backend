// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import {IReward} from "../src/I.tokencontract.sol";                     // copy pasta of IERC20


/**
* @dev TokenManager contract is custodian of the FTN tokens, 
* as minted by the (ERC20) Reward contract on deployment
*
* @dev TokenManager contract inherits from ReentrancyGuard and
* imlements the nonReentrant modifier for transferReward()
*
* @dev transferReward() function sends a low-level call to the 
* Reward token contract, which makes the FTN token transfer 
* from TokenManager to the user
**/


contract TokenManager is ReentrancyGuard {
    address public rewardTokenAddress;
    address public lockdropAddress;
    address public owner;
    event RewardTransferred(address indexed _user, uint256 _amount);
    event RewardBalanceZero();
    event NewApproval(address _spender, uint256 _amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier onlyLockDrop() {
        require(msg.sender == lockdropAddress);
        _;
    }

    modifier addressIsNotZero() {
        require(rewardTokenAddress != address(0), "Address is zero, not allowed for ERC20 transfers");
        _;
    }

    function setRewardTokenAddress(address _rewardTokenAddress) external onlyOwner {
        rewardTokenAddress = _rewardTokenAddress;
    }

    function setLockDropAddress(address _lockdropAddress) external onlyOwner {
        lockdropAddress = _lockdropAddress;
    }


    function topUpFtn(uint256 _amount) external onlyOwner {
        // require(IERC20(rewardTokenAddress).transfer(msg.sender, _amount), "FTN top-up failed...");
        (bool success, ) = rewardTokenAddress.call(abi.encodeWithSignature("transfer(address,uint256)", msg.sender, _amount));
        require(success, "FTN token top-up failed...");  
    }


    function approve(address _spender, uint256 _amount) external {
        require(IERC20(rewardTokenAddress).approve(_spender, _amount), "Failed to approve FTN for spend");
        emit NewApproval(_spender, _amount);
    }

    function transferReward(address _to, uint256 _amount) external nonReentrant onlyLockDrop addressIsNotZero {  

        // Check remaining reward token balance with Reward contract before transfer                  
        uint256 remainingBalance = IERC20(rewardTokenAddress).balanceOf(address(this));

        // Transfer logic                                              
        uint256 transferAmount;                                      
        if (remainingBalance == 0) {
            transferAmount = 0;      
            emit RewardBalanceZero();                          
        } else if (remainingBalance < _amount) {
            transferAmount = remainingBalance;            
        } else {
            transferAmount = _amount;
        }

        require(IERC20(rewardTokenAddress).transfer(_to, _amount), "FTN token transfer failed...");

        emit RewardTransferred(msg.sender, transferAmount);
    }  
}



        