// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";


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
    event Allowance(address _owner, address _spender, uint256 _allowance);
    event TotalSupply(uint256 _supply);
    event BalanceOf(uint256 _account);


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
        rewardTokenAddress = _rewardTokenAddress;                                           // <--  here  #ToDo 
    }

    function setLockDropAddress(address _lockdropAddress) external onlyOwner {
        lockdropAddress = _lockdropAddress;
    }

    function transfer(address _to, uint256 _amount) external onlyOwner {
        require(IERC20(rewardTokenAddress).transfer(_to, _amount), "FTN top-up (transfer) failed...");
    }

    function approve(address _spender, uint256 _amount) external {
        require(IERC20(rewardTokenAddress).approve(_spender, _amount), "Failed to approve FTN for spend");
        emit NewApproval(_spender, _amount);
    }


    function allowance(address _owner, address _spender) external returns (uint256) {
        uint256 _allowance = IERC20(rewardTokenAddress).allowance(_owner, _spender);
        emit Allowance(_owner, _spender, _allowance);
        return _allowance;
    }


    function transferFrom(address _from, address _to, uint256 _value) external {
        require(IERC20(rewardTokenAddress).transferFrom(_from, _to, _value), "transferFrom failed");  // test here #ToDo 
    }      


    function totalSupply() external returns (uint256) {
        uint256 _supply = IERC20(rewardTokenAddress).totalSupply();      // added _tokenAddress argument #ToDo
        emit TotalSupply(_supply);
        return _supply;
    }

    function balanceOf(address _account) external returns (uint256) {
        uint256 _balanceOf = IERC20(rewardTokenAddress).balanceOf(_account);
        emit BalanceOf(_balanceOf);
        return _balanceOf;
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

        require(IERC20(rewardTokenAddress).transfer(_to, _amount), "FTN token transfer failed..."); // _amount should be transferAmount ?  ToDo

        emit RewardTransferred(msg.sender, transferAmount);
    }  
}






        