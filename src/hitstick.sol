// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HitStick {
    address public owner;
    uint256 public cardCount;

    address public player;
    address public dealer;

    struct PlayerAccount {
        address player;
        int256 winRecord;       
        uint256 bonus;      // v1. :- bonus = 0
                            // v2. :- bonus = some function of winRecord
    }

    mapping (address => PlayerAccount) public playerBalance;   

    constructor(address _owner) {
        owner = _owner;
    }

    function startGame() public {
        // set up the player account stuff
    }
 
    function drawCard() external {
        // uint256 card;
        // call random words
        // call (or use previous) random number to simulate the card draw as above 
        // update cardCount...
        if (cardCount < 21) {
            // ToDo 
        }
        // call gameBrain()
    }

    function getRandomness() internal pure returns(uint256) {
        // get randonmess in order to draw a card
        uint256 randomNumber;
        return randomNumber;
    }

    function gameBrain() internal {
        // perform the "pick winner" calculation
        // if blah, then meh...
    }
} 

/* 
        **  Hit or Stick - Twenty One  **

    1. Map the 52 cards to a uint8 'identifier' between 1-52

    2. DEALER
    3. PLAYER

        **  DEALER sticks on 18  **
    
    4. DEALER/PLAYER gets initial 1-card draw:
    
        --> random number 1-52 :- draw that card for the DEALER
        --> random number 1-52 :- draw that card for the PLAYER
    
    5. Player decision point -- hit/stick loop

    6. Dealer decision point -- hit/stick loop

    7. Winner decision

*/

