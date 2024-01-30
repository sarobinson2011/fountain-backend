// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./I.tokencontract.sol";

contract LockDrop {
    address public owner;
    IReward public tokenReward; // IReward == IERC20

    struct TimedDeposit {
        uint256 amount;
        uint256 timestamp;
        uint256 reward;         // need logic to calculate the reward distribution
    }

    mapping (address => TimedDeposit) public balances;   
    event NewDeposit(address indexed _user, uint256 _amount);
    event NewWithdraw(address indexed _user, uint256 _amount);

    constructor() {
        owner = msg.sender;
        tokenReward = IReward(address(this));   // RWDZ tokens are held in THIS contract
    }

    function deposit() external payable {
        balances[msg.sender] = TimedDeposit(
            {
                amount: msg.value, 
                timestamp: block.timestamp,
                reward: 0                       // zero upon deposit
            }
        );
        emit NewDeposit(msg.sender, msg.value);
    } 
    
    function withdraw() external {
        require(balances[msg.sender].amount > 0, "You have no balance to withdraw...");
        require(block.timestamp >= balances[msg.sender].timestamp + 5 minutes, "Time lock not expired...");
        
        // Calculate reward as 10% of the deposited amount
        // uint256 reward = balances[msg.sender].amount / 10;
        
        uint256 tempAmount = balances[msg.sender].amount;
        balances[msg.sender].amount = 0;
        balances[msg.sender].timestamp = 0;

        // Transfer the tokens to the withdrawer
        // require(token.transfer(msg.sender, reward), "Token transfer failed");

        balances[msg.sender].reward = 0;
        payable(msg.sender).transfer(tempAmount);
        tempAmount = 0;
        emit NewWithdraw(msg.sender, tempAmount);
    }
} 

