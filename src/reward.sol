// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Reward is ERC20 {

    constructor(string memory _name, string memory _symbol, address _address, uint256 _supply) ERC20(_name, _symbol) {
        _mint(_address, _supply);
    }

    function transferReward(address _to, uint256 _amount) public { 
        transfer(_to, _amount);
    }
}


