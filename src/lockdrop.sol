// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract LockDrop {
    address public owner;
    IERC20 public rewardTokens; // IReward == IERC20

    struct TimedDeposit {
        uint256 amount;
        uint256 timestamp;
    }

    mapping (address => TimedDeposit) public balances;   

    event NewDeposit(address indexed _user, uint256 _amount);
    event NewWithdraw(address indexed _user, uint256 _amount);
    event RwdzTransferred(address indexed _user, uint256 _amount);

    constructor() {
        owner = msg.sender;
        rewardTokens = IERC20(address(this));  // RWDZ tokens held in THIS contract
    }

    function deposit(uint256 _amount) external payable {

        require(msg.value > 0, "deposit amount must be greater than zero"); 
        // Check if enough Ether was sent to cover the deposit and gas fees
        require(msg.value >= _amount, "Insufficient funds sent for deposit");

        balances[msg.sender] = TimedDeposit(
            {
                amount: _amount, 
                timestamp: block.timestamp
            }
        );
        emit NewDeposit(msg.sender, _amount);
    } 
    
    function withdraw() external {
        require(balances[msg.sender].amount > 0, "You have no balance to withdraw...");
        require(block.timestamp >= balances[msg.sender].timestamp + 1 minutes, "Time lock not expired...");
 
        uint256 reward = calculateReward(); //    <-- returns the reward value to transfer
 
        uint256 tempAmount = balances[msg.sender].amount;
        balances[msg.sender].amount = 0;
        balances[msg.sender].timestamp = 0;
               
        // Transfer deposited Ether to the withdrawer                       <-- this WORKS !
        (bool success, ) = payable(msg.sender).call{value: tempAmount}("");
        require(success, "Ether transfer failed");
        emit NewWithdraw(msg.sender, tempAmount);
        tempAmount = 0;

         // Transfer RWDZ tokens to the withdrawer                          <-- test this bit
        // bool successRwdz = rewardTokens.transfer(msg.sender, reward);
        // require(successRwdz, "RWDZ token transfer failed");
        // emit RwdzTransferred(msg.sender, reward);
        reward = 0;
    }

    function calculateReward() internal pure returns (uint256) {
        // uint256 reward = balances[msg.sender].amount / 10;
        uint256 reward = 100;
        return reward;    
    }
} 



