// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {MyToken} from "../src/myToken.sol"; 

contract MyTokenDeposit {
    address public owner;
    MyToken public myToken;

    mapping(address => uint256) public userBalances;

    constructor(address myTokenAddress) {
        myToken = MyToken(myTokenAddress);
    }

    function deposit(uint256 amount) public {
        myToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
    }

    function withdraw(uint256 amount) public {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        myToken.transfer(msg.sender, amount);
    }
}