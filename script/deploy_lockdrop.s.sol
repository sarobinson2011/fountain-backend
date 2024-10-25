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
        address account3 = 0xC26741bac14a3Ba52517D6fD825eF4513454178E;

        uint256 supply = 1_000_000 * (10**18);
        uint256 amount = 23 * (10**18);
        uint256 amount2 = 4 * (10**18);

        address tokenmanager = vm.envAddress("TOKEN_MANAGER_ADDRESS");
        address reward = vm.envAddress("REWARD_ADDRESS");
        // address lockdrop = vm.envAddress("LOCKDROP_ADDRESS");

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy reward token manager
        // new TokenManager();

        // deploy the FTN token contract
        // new Reward("Fountain", "FTN", tokenmanager, supply);
        
        // set Reward Token Address (in TokenManager) 
        // ITokenManager(tokenmanager).setRewardTokenAddress(reward);

        // deploy lockdrop
        // new LockDrop(tokenmanager); 

        // **** new commands ****
        //
        ITokenManager(tokenmanager).totalSupply();
        // ITokenManager(tokenmanager).balanceOf(account);
        // ITokenManager(tokenmanager).transfer(account, amount);

        // ITokenManager(tokenmanager).approve(tokenmanager, amount);
        // ITokenManager(tokenmanager).allowance(account, tokenmanager);

        // uint256 allowance = ITokenManager(tokenmanager).allowance(account, tokenmanager);
        // console.log("Allowance amount ", allowance);     //  #ToDo
        
        // ITokenManager(tokenmanager).transferFrom(account, tokenmanager, amount2);

        // stop broadcast
        vm.stopBroadcast();
    }
}


