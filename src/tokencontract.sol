// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/* 
    Simple contract to test contract verification
*/

contract Reward is ERC20 {
    address public owner;
    
    constructor(string memory _name, string memory _symbol, address _address, uint256 _supply) ERC20(_name, _symbol) {
        owner = msg.sender;
        _mint(_address, _supply);
    }
    
}






