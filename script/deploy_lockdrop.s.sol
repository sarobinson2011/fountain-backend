// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol"; 
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/reward.sol";
import {LockDrop} from "../src/lockdrop.sol";
import {ILockDrop} from "../src/I.lockdrop.sol";
import {TokenManager} from "../src/rewardtokenmanager.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        address account2 = 0xC26741bac14a3Ba52517D6fD825eF4513454178E;

        uint256 supply = 1_000_000 * (10**18);
        uint256 amount = 100 * (10**18);
        uint256 amount2 = 40 * (10**18);

        address tokenmanager = vm.envAddress("TOKEN_MANAGER_ADDRESS");
        address reward = vm.envAddress("REWARD_ADDRESS");
        address lockdrop = vm.envAddress("LOCKDROP_ADDRESS");

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy reward token manager
        // new TokenManager();

        // deploy the FTN token contract
        // new Reward("Fountain", "FTN", tokenmanager, supply);

        // deploy lockdrop
        // new LockDrop(tokenmanager, reward); 


        // **** wire the system up ****
        // ITokenManager(tokenmanager).setLockDropAddress(lockdrop);
        // ITokenManager(tokenmanager).setRewardTokenAddress(reward);
        
        // ITokenManager(tokenmanager).transferFTN(account, amount);   

        // IERC20(reward).approve(lockdrop, amount2);                      

        // uint256 allowance = IERC20(reward).allowance(account, lockdrop);
        // console.log("allowance = ", allowance);
                                                                         
        // ILockDrop(lockdrop).deposit(amount2);
        ILockDrop(lockdrop).withdraw();           
        

        // stop broadcast
        vm.stopBroadcast();
    }
}

