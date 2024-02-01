// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./I.tokencontract.sol";

contract LockDrop {
    address public owner;
    IReward public rewardTokens; // IReward == IERC20

    struct TimedDeposit {
        uint256 amount;
        uint256 timestamp;
        // uint256 reward;         // need logic to calculate the reward distribution
    }

    mapping (address => TimedDeposit) public balances;   
    event NewDeposit(address indexed _user, uint256 _amount);
    event NewWithdraw(address indexed _user, uint256 _amount);
    event RwdzTransferred(address indexed _user, uint256 _amount);

    constructor() {
        owner = msg.sender;
        rewardTokens = IReward(address(this));   // RWDZ tokens are held in THIS contract
    }

    function deposit() external payable {
        balances[msg.sender] = TimedDeposit(
            {
                amount: msg.value, 
                timestamp: block.timestamp
                // reward: 0                       // zero upon deposit
            }
        );
        emit NewDeposit(msg.sender, msg.value);
    } 
    
    function withdraw() external {
        require(balances[msg.sender].amount > 0, "You have no balance to withdraw...");
        require(block.timestamp >= balances[msg.sender].timestamp + 2 minutes, "Time lock not expired...");
 
        uint256 reward = calculateReward(); //    <-- returns the reward value to transfer
 
        uint256 tempAmount = balances[msg.sender].amount;
        balances[msg.sender].amount = 0;
        balances[msg.sender].timestamp = 0;
               
        // Transfer deposited Ether to the withdrawer
        (bool success, ) = payable(msg.sender).call{value: tempAmount}("");
        require(success, "Ether transfer failed");
        emit NewWithdraw(msg.sender, tempAmount);
        tempAmount = 0;

         // Transfer RWDZ tokens to the withdrawer
        require(rewardTokens.transfer(msg.sender, reward), "RWDZ token transfer failed");
        emit RwdzTransferred(msg.sender, reward);
        reward = 0;
    }

    function calculateReward() internal view returns (uint256) {
        uint256 reward = balances[msg.sender].amount / 10;
        return reward;    
    }
} 

