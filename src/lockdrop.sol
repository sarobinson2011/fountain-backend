// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {TokenManager} from "../src/rewardtokenmanager.sol";
import {VRFv2Consumer} from "../src/vrfv2consumer.sol";
import {RandomNumberGenerator} from "../src/randomnumbergenerator.sol";
import {IRandomNumberGenerator} from "../src/I.randomnumbergenerator.sol";


interface TokenManagerInterface {
    function transferReward(address _to, uint256 _amount) external;
    function setRewardTokenAddress(address _rewardTokenAddress) external;
}

contract LockDrop {
    address public tokenManagerAddress;
    VRFv2Consumer public vrfv2consumer; // instance of VRFv2Consumer contract
    RandomNumberGenerator public randomnumbergenerator;


    struct TimedDeposit {
        uint256 amount;
        uint256 timestamp;
    }

    mapping (address => TimedDeposit) public balances;   

    event NewDeposit(address indexed _user, uint256 _amount, uint256 _timestamp);
    event NewWithdraw(address indexed _user, uint256 _amount, uint256 _timestamp);

    constructor(address _tokenmanager, address _vrfv2consumer, address _randomnumbergenerator) {
        tokenManagerAddress = _tokenmanager;
        vrfv2consumer = VRFv2Consumer(_vrfv2consumer);
        randomnumbergenerator = RandomNumberGenerator(_randomnumbergenerator);
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

    function calculateReward() internal  returns(uint256) {
        // reward can hold values 0-255
        uint8 reward = 0;

        // get a randomnumber - returns uint256
        randomnumbergenerator.requestRandomWords();
        (bool fulfilled, ) = randomnumbergenerator.getRequestStatus();
        require(fulfilled, "Request not fulfilled");
        uint256 randomWord = randomnumbergenerator.randomNumGenerator();
        
        // use the return value to generate a number 1-20
        reward = uint8(randomWord % 20) + 1;
        
        return reward;
    }
}




