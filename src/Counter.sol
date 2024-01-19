// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

contract Counter {
    uint256 public _number;

    function setNumber(uint256 newNumber) public {
        _number = newNumber;
    }

    function increment() public {
        _number++;
    }
}

