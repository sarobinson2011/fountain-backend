// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/reward.sol";
import {LockDrop} from "../src/lockdrop.sol";
import {ILockDrop} from "../src/I.lockdrop.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        // uint256 amount = 15 * (10**18);
        uint256 blockReward = 0;
        uint256 topUpAmount = 100 * (10**18);
        uint256 amount = 5 * (10**18); 
        uint256 allowance = 0;

        address tokenmanager = vm.envAddress("TOKEN_MANAGER_ADDRESS");
        address reward = vm.envAddress("REWARD_ADDRESS");
        address lockdrop = vm.envAddress("LOCKDROP_ADDRESS");

        console.log("Account:", account);
        
        // start broadcast
        vm.startBroadcast(privateKey);


        // ===========  Lottery  ===========

        // Set VRF Consumer
        // IRandomNumberGenerator(randomnumbergenerator).setVrfConsumer(vrfconsumer);

        // Set Lockdrop Address 
        // IVRFv2Consumer(vrfconsumer).setLockdropAddress(lockdrop); 


        // ========  TokenManager  =========

        // 1a/. Set LockDrop address in TokenManager
        // ITokenManager(tokenmanager).setLockDropAddress(lockdrop);

        // 1b/. Top-up with FTN tokens
        // ITokenManager(tokenmanager).topUpFtn(topUpAmount);  // ToDo
        // ITokenManager(tokenmanager).transfer(account, topUpAmount);

        // 1c/. Approve FTN tokens for deposit
        // ITokenManager(tokenmanager).approveFtn(tokenmanager, amount);  
        //                            _spender tokenmanager or lockdrop ??

        // ===========  LockDrop  ==========

        // 1a/. DEPOSIT ETH
        // ILockDrop(lockdrop).deposit{value: 0.0001 ether}();    
     
        // 1c/. APPROVE FTN
        // ILockDrop(lockdrop).approve(lockdrop, amount);  

        // 1d/. ALLOWANCE FTN 
        // allowance = IERC20(reward).allowance(lockdrop, account);
        // console.log("allowance: ", allowance);

        // 1d/. DEPOSIT FTN
        // ILockDrop(lockdrop).deposit(ftnDeposit); 

        // 2/. WITHDRAW 
        // ILockDrop(lockdrop).withdraw();

        // 3/. call fetchBlockReward
        // blockReward = ILockDrop(lockdrop).fetchBlockReward();
        // console.log("FTN token reward: ", blockReward);


        // stop broadcast
        vm.stopBroadcast();
    }
}   

// call deposit _amount (of reward tokens) to lockdrop        <-- 1) here !!
// call withdraw _amount (of reward tokens) from lockdrop          <-- 2) and here !!