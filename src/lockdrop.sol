// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {TokenManager} from "../src/rewardtokenmanager.sol";
import {IVRFv2Consumer} from "../src/I.vrfv2consumer.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";
import {IRandomNumberGenerator} from "../src/I.randomnumbergenerator.sol";


interface TokenManagerInterface {
    function transferReward(address _to, uint256 _amount) external;
    function setRewardTokenAddress(address _rewardTokenAddress) external;
}

contract LockDrop {
    address public tokenManagerAddress;
    address public vrfv2consumer;
    address public randomnumbergenerator;
    uint256 public requestId;

    // rewards can hold values 0-255
    uint256 public rewards;
    
    struct TimedDeposit {
        uint256 amount;
        uint256 timestamp;
        uint256 reward;
    }

    mapping (address => TimedDeposit) public balances;   

    event NewDeposit(address indexed _user, uint256 _amount, uint256 _timestamp);
    event NewWithdraw(address indexed _user, uint256 _amount, uint256 _timestamp);

    constructor(address _tokenmanager, address _vrfv2consumer, address _randomnumbergenerator) {
        rewards = 0;
        requestId = 0;
        tokenManagerAddress = _tokenmanager;
        vrfv2consumer = _vrfv2consumer;
        randomnumbergenerator = _randomnumbergenerator;
    }

    function deposit() external payable {
        require(msg.value > 0, "deposit amount must be greater than zero"); 
        
        if (balances[msg.sender].amount > 0) {
            balances[msg.sender].amount += msg.value;
        } else {
            balances[msg.sender] = TimedDeposit(
            {
                amount: msg.value, 
                timestamp: block.timestamp,
                reward: 0
            });
        } 

        // Reset timestamp upon every deposit to enforce full time lock
        balances[msg.sender].timestamp = block.timestamp;                   
        emit NewDeposit(msg.sender, msg.value, block.timestamp);
    }    

    
    function withdraw() external {
        require(balances[msg.sender].amount > 0, "You have no balance to withdraw...");
        require(block.timestamp >= balances[msg.sender].timestamp + 1 minutes, "Time lock not expired...");
  
        // calculateReward();                                           // start <-- 
        rewards = 1; // for now
        balances[msg.sender].reward = rewards;                          // here <--

        uint256 tempAmount = balances[msg.sender].amount;
        balances[msg.sender].amount = 0;
        balances[msg.sender].timestamp = 0;
               
        // Transfer deposited Ether to the withdrawer                     
        (bool success, ) = payable(msg.sender).call{value: tempAmount}("");
        require(success, "Ether transfer failed");
        emit NewWithdraw(msg.sender, tempAmount, block.timestamp);
        tempAmount = 0;

        // Transfer the RWDZ tokens 
        // TokenManagerInterface tokenManager = TokenManagerInterface(tokenManagerAddress);
        ITokenManager(tokenManagerAddress).transferReward(msg.sender, balances[msg.sender].reward);      
        rewards = 0;
        // reset the struct parameters
        balances[msg.sender].reward = 0;
    }


    function calculateReward() internal pure returns(uint256) {
        uint256 reward = 0;      
        return reward;
    }
}


