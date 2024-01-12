// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/* 
    Simple contract to test contract verification
*/

contract SimpleToken is ERC20 {
    address public _owner;
    
    constructor() ERC20("MyToken", "MTK") {
        _owner = msg.sender;
    }
    
}

// forge flatten --output src/simple.flattened.sol src/simple.sol

// forge verify-contract --chain-id 1313161555 --num-of-optimizations 1000000 --watch \
//     --compiler-version v0.8.22+commit.4fc1097e \
//     <the_contract_address> \
//     src/simple.sol:SimpleToken 

// forge verify-contract --chain-id 1313161555 --num-of-optimizations 1000000 --watch --compiler-version v0.8.22+commit.4fc1097e 0xB864c40A6F9d20B9500f14f239862899ea8aC772 src/simple.sol:SimpleToken





