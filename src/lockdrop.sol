// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {TokenManager} from "../src/rewardtokenmanager.sol";


interface TokenManagerInterface {
    function transferReward(address _to, uint256 _amount) external;
    function setRewardTokenAddress(address _rewardTokenAddress) external;
}

contract LockDrop {
    address public owner;
    address public tokenManagerAddress;

    struct TimedDeposit {
        uint256 amount;
        uint256 timestamp;
    }

    mapping (address => TimedDeposit) public balances;   

    event NewDeposit(address indexed _user, uint256 _amount, uint256 _timestamp);
    event NewWithdraw(address indexed _user, uint256 _amount, uint256 _timestamp);

    constructor(address _tokenmanager) {
        owner = msg.sender;
        tokenManagerAddress = _tokenmanager;
    }

    function deposit() external payable {
        require(msg.value > 0, "deposit amount must be greater than zero"); 
        
        if (balances[msg.sender].amount > 0) {
            balances[msg.sender].amount += msg.value;
        } else {
            balances[msg.sender] = TimedDeposit(
            {
                amount: msg.value, 
                timestamp: block.timestamp
            });
        }

        // Reset timestamp upon every deposit to enforce full time lock
        balances[msg.sender].timestamp = block.timestamp;                   
        emit NewDeposit(msg.sender, msg.value, block.timestamp);
    }    

    
    function withdraw() external {
        require(balances[msg.sender].amount > 0, "You have no balance to withdraw...");
        require(block.timestamp >= balances[msg.sender].timestamp + 1 minutes, "Time lock not expired...");
 
        uint256 reward = calculateReward();
 
        uint256 tempAmount = balances[msg.sender].amount;
        balances[msg.sender].amount = 0;
        balances[msg.sender].timestamp = 0;
               
        // Transfer deposited Ether to the withdrawer                     
        (bool success, ) = payable(msg.sender).call{value: tempAmount}("");
        require(success, "Ether transfer failed");
        emit NewWithdraw(msg.sender, tempAmount, block.timestamp);
        tempAmount = 0;

        // Transfer the RWDZ tokens 
        TokenManagerInterface tokenManager = TokenManagerInterface(tokenManagerAddress);
        tokenManager.transferReward(msg.sender, reward); 
        reward = 0;
    }

    function calculateReward() internal pure returns (uint256) {
        // uint256 reward = balances[msg.sender].amount / 10;
        uint256 reward = 10 * (10**18);
        return reward;    
    }
}


