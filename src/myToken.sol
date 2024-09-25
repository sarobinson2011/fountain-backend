// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    
    constructor(string memory _name, string memory _symbol, address _address, uint256 _supply) ERC20(_name, _symbol) {
        _mint(_address, _supply);
    }
}

/*

Core Functions

   - balanceOf(address account): Returns the balance of a specific account.
   - totalSupply(): Returns the total supply of tokens in circulation.
   - transfer(address to, uint256 amount): Transfers tokens from the sender to a recipient.
   - transferFrom(address from, address to, uint256 amount): Transfers tokens from one account to another on behalf of a third party.
   - approve(address spender, uint256 amount): Approves a spender to spend tokens on behalf of the owner.
   - allowance(address owner, address spender): Returns the amount of tokens that a spender is allowed to spend on behalf of the owner.

Additional Functions (Optional)

   - increaseAllowance(address spender, uint256 addedValue): Increases the allowance for a spender.
   - decreaseAllowance(address spender, uint256 subtractedValue): Decreases the allowance for a spender.

Events

   - Transfer(address indexed from, address indexed to, uint256 value): Emitted when tokens are transferred.
   - Approval(address indexed owner, address indexed spender, uint256 value): Emitted when an allowance is approved or updated.

*/
