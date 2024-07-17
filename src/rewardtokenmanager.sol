// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";


/**
* @dev TokenManager contract is custodian of the RWDZ tokens, 
* as minted by the (ERC20) Reward token contract on deployment
*
* @dev TokenManager contract inherits from ReentrancyGuard and
* imlements the nonReentrant modifier for transferReward()
*
* @dev transferReward() function sends a low-level call to the 
* Reward token contract, which makes the RWDZ token transfer 
* from TokenManager to the user
**/


contract TokenManager is ReentrancyGuard {
    address public rewardTokenAddress;
    address public owner;
    event RewardTransferred(address indexed _user, uint256 _amount);
    event RewardBalanceZero(address indexed _user, bool _trueFalse);

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

    function returnRewardTokenAddress() public view returns(address) {
        return rewardTokenAddress;
    }
    

    function transferReward(address _to, uint256 _amount) external nonReentrant addressIsNotZero {  

        // Check remaining reward token balance with Reward contract before transfer                  
        uint256 remainingBalance = IERC20(rewardTokenAddress).balanceOf(address(this));

        // Transfer logic                                              
        uint256 transferAmount;                                      
        if (remainingBalance == 0) {
            emit RewardBalanceZero(msg.sender, true);           // <-- catch + display in React app
            transferAmount = 0;
        } else if (remainingBalance < _amount) {
            transferAmount = remainingBalance;            
        } else {
            transferAmount = _amount;
        }

        (bool success, ) = rewardTokenAddress.call(abi.encodeWithSignature("transferReward(address,uint256)", _to, transferAmount));
        require(success, "RWDZ token transfer failed...");
        emit RewardTransferred(msg.sender, transferAmount);
    }   
}


        