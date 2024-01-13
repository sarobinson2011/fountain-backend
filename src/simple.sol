// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/* 
    Simple contract to test contract verification
*/

// contract SimpleToken is ERC20 {
//     address public _owner;
    
//     constructor() ERC20("MyToken", "MTK") {
//         _owner = msg.sender;
//     }
    
// }

contract SimpleToken is ERC20 {
    address public owner;
    
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        owner = msg.sender;
    }
    
}






