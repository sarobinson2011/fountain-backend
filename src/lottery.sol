// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import Chainlink VRF Coordinator interface
import "@chainlink/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/vrf/VRFConsumerBaseV2.sol";
import {VRFv2Consumer} from "../src/vrfv2consumer.sol";

contract Lottery {

    // Randomness variables
    uint256 public randomNumber;

    // Lottery variables
    address payable[] public players;
    address public owner;
    uint public entryFee;
    uint public maxPlayers;
    bool public lotteryOpen;

    // Events
    event PlayerJoined(address indexed player);
    event WinnerPicked(address indexed winner);

    constructor(
        address _owner,
        uint256 _entryFee,
        uint256 _maxPlayers
    ) {
        entryFee = _entryFee;
        maxPlayers = _maxPlayers;
        lotteryOpen = true;
        owner = _owner;
    }

    modifier onlyAuthorized() {
        require(
            msg.sender == owner, "Not authorized, sorry"
        );
        _;
    }

    function joinLottery() public payable {
        require(lotteryOpen, "Lottery is closed");
        require(msg.value == entryFee, "Incorrect entry fee");
        require(players.length < maxPlayers, "Lottery is full");

        players.push(payable(msg.sender));
        emit PlayerJoined(msg.sender);

        // Check if enough players joined, request randomness
        if (players.length == maxPlayers) {
            // requestRandomWords(KEYHASH);     // <-- this needs sorting, requesting the entropy
        }
    }

    function selectWinner() private {
        address payable winner = players[randomNumber];
        winner.transfer(address(this).balance);
        lotteryOpen = false;
        emit WinnerPicked(winner);
    }

    // Function to allow restarting the lottery (for testing)
    function resetLottery() public {
        require(!lotteryOpen, "Lottery is currently running");
        delete players;
        randomNumber = 0;
        lotteryOpen = true;
    }
}
