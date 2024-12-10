// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import {TokenManager} from "../src/rewardtokenmanager.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";


contract LockDrop {
    address public owner;
    address public tokenManagerAddress;
    address public rewardTokenAddress;
    uint256 public rewardValue;
    uint256[] public tierMultiplier = [1, 3, 10];
    uint256[] public tierNumberOfBlocks = [10, 25, 30];         // 12 sec block time --> approx 5 blocks/min 
    
    struct TimedDeposit {
        uint256 amount;
        uint256 blockstamp;
        uint256 reward;
    }

    mapping (address => TimedDeposit) public balances;   

    event NewDeposit(address indexed _user, uint256 _amount, uint256 _blockstamp);
    event NewWithdraw(address indexed _user, uint256 _amount, uint256 _blockstamp);
    event NewApproval(address indexed _spender, uint256 _amount);
    event RewardReturned(address indexed _user, uint256 _amount);
    event RewardBalanceZero();

    constructor(address _tokenmanager, address _rewardTokenAddress) {
        owner = msg.sender;
        tokenManagerAddress = _tokenmanager;
        rewardTokenAddress = _rewardTokenAddress;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function deposit(uint256 _amount) external {
        require(_amount > 0, "deposit amount must be greater than zero"); 
        
        require(IERC20(rewardTokenAddress).transferFrom(msg.sender, address(this), _amount), "Deposit failed, check balance"); 

        if (balances[msg.sender].amount > 0) {
            balances[msg.sender].amount += _amount;
        } else {
            balances[msg.sender] = TimedDeposit(
            {
                amount: _amount, 
                blockstamp: block.number,
                reward: 0
            });
        } 

        // Reset the time lock upon each deposit
        balances[msg.sender].blockstamp = block.number;                   
        emit NewDeposit(msg.sender, _amount, block.number);
    }    

    function withdraw() external {
        require(balances[msg.sender].amount > 0, "You have no FTN balance to withdraw...");
        require(block.number > balances[msg.sender].blockstamp, "block error...");
  
        balances[msg.sender].reward = calculateReward(); 
               
        // Transfer reward balance
        ITokenManager(tokenManagerAddress).transferReward(msg.sender, balances[msg.sender].reward);
        
        // Transfer deposit balance                         
        IERC20(rewardTokenAddress).transfer(msg.sender, balances[msg.sender].amount);

        // Reset balances
        balances[msg.sender].amount = 0;
        balances[msg.sender].blockstamp = 0;
        balances[msg.sender].reward = 0;

        emit NewWithdraw(msg.sender, balances[msg.sender].amount, block.timestamp);        
        emit RewardReturned(msg.sender, balances[msg.sender].reward);   
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

    function fetchBlockReward() external returns(uint256) {     // returns (and emits) the current reward value
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


