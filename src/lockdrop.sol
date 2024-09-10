// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {TokenManager} from "../src/rewardtokenmanager.sol";
import {IVRFv2Consumer} from "../src/I.vrfv2consumer.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";
import {IRandomNumberGenerator} from "../src/I.randomnumbergenerator.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";


contract LockDrop {
    address public tokenManagerAddress;
    uint256 public rewardValue;
    uint256[] public tierMultiplier = [1, 3, 10];
    uint256[] public tierNumberOfBlocks = [10, 25, 30]; // 12 sec block time --> 5 blocks/min 
    //                                    [2,  5,  6+]  minutes
    
    struct TimedDeposit {
        uint256 amount;
        uint256 blockstamp;
        uint256 reward;
    }

    mapping (address => TimedDeposit) public balances;   

    event NewDeposit(address indexed _user, uint256 _amount, uint256 _blockstamp);
    event NewWithdraw(address indexed _user, uint256 _amount, uint256 _blockstamp);
    event RewardReturned(address indexed _user, uint256 _amount);
    event RewardBalanceZero();

    constructor(address _tokenmanager) {
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
                blockstamp: block.number,
                reward: 0
            });
        } 

        // Reset timestamp upon every deposit to enforce full time lock
        balances[msg.sender].blockstamp = block.number;                   
        emit NewDeposit(msg.sender, msg.value, block.number);
    }    


    function withdraw() external {
        require(balances[msg.sender].amount > 0, "You have no balance to withdraw...");
        require(block.number > balances[msg.sender].blockstamp);
  
        balances[msg.sender].reward = calculateReward(); 
        rewardValue = balances[msg.sender].reward;                       

        uint256 tempAmount = balances[msg.sender].amount;
        balances[msg.sender].amount = 0;
        balances[msg.sender].blockstamp = 0;
               
        // Transfer deposited Ether to the withdrawer                     
        (bool success, ) = payable(msg.sender).call{value: tempAmount}("");
        require(success, "Ether transfer failed");
        emit NewWithdraw(msg.sender, tempAmount, block.timestamp);
        tempAmount = 0;


        // Transfer the Reward tokens 
        ITokenManager(tokenManagerAddress).transferReward(msg.sender, balances[msg.sender].reward); 
        emit RewardReturned(msg.sender, balances[msg.sender].reward);          
        balances[msg.sender].reward = 0;
    }


    function calculateReward() internal view returns(uint256) {
        uint256 currentBlock = block.number;
        uint256 startingBlock = balances[msg.sender].blockstamp; 
        uint256 reward = 0;

        // Check for potential underflow (startingBlock > currentBlock)
        if (startingBlock > currentBlock) {
            revert("Starting block cannot be greater than the current block!");
        }

        uint256 elapsedBlocks = currentBlock - startingBlock;
        
        // Determine user's tier index for reward calculation 
        uint256 tierIndex = 0;
        for (uint256 i = 0; i < tierNumberOfBlocks.length; i++) {
            if (elapsedBlocks > tierNumberOfBlocks[i]) {
                tierIndex = i + 1;
            } else {
                break;
            }
        }

        if (tierIndex >= tierMultiplier.length) {
            tierIndex = tierMultiplier.length - 1;  // set to the highest tier
        }

        // Reward calculation
        reward = elapsedBlocks * 5 * (10**17) * tierMultiplier[tierIndex];
        return reward;
    }


    function fetchBlockReward() external returns(uint256) {         // returns (and emits) the current reward value
        uint256 blockReward = 0;

        if (balances[msg.sender].amount > 0) {
        
            uint256 currentBlock = block.number;
            uint256 startingBlock = balances[msg.sender].blockstamp; 

            // Check for potential underflow (startingBlock > currentBlock)
            if (startingBlock > currentBlock) {
                revert("Starting block cannot be greater than the current block!");
            }

            uint256 elapsedBlocks = currentBlock - startingBlock;
            
            uint256 tierIndex = 0;
            for (uint256 i = 0; i < tierNumberOfBlocks.length; i++) {
                if (elapsedBlocks > tierNumberOfBlocks[i]) {             
                    tierIndex = i + 1;
                } else {
                    break;
                }
            }

            if (tierIndex >= tierMultiplier.length) {
                tierIndex = tierMultiplier.length - 1;  // set to the highest tier
            }

            // Reward calculation
            blockReward = elapsedBlocks * 5 * (10**17) * tierMultiplier[tierIndex];

        } else {
            blockReward = 0;
        }

        emit RewardReturned(msg.sender, blockReward);
        return blockReward;
    }
}


