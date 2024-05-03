// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import Chainlink VRF Coordinator interface
import "@chainlink/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/vrf/VRFConsumerBaseV2.sol";
import {IVRFv2Consumer} from "../src/I.vrfv2consumer.sol";


contract Lottery {

    // Randomness variables
    uint256 public randomNumber;
    address public vrfconsumer;

    // Lottery variables
    address payable[] public players;
    address public owner;
    uint public entryFee;
    uint public maxPlayers;
    bool public lotteryOpen;

    // console.log the winner
    address public winner;

    // Events
    event PlayerJoined(address indexed player);
    event WinnerPicked(address indexed winner);

    constructor(
        uint256 _entryFee,
        uint256 _maxPlayers
    ) {
        entryFee = _entryFee;
        maxPlayers = _maxPlayers;
        lotteryOpen = true;
        owner = msg.sender;
    }

    modifier onlyAuthorized() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function returnWinner() public view returns(address) {
        return winner;
    }

    function setVrfConsumer(address _vrfconsumer) public onlyAuthorized {
        vrfconsumer = _vrfconsumer;
    }

    function joinLottery() public payable {
        require(lotteryOpen, "Lottery is closed");
        require(msg.value == entryFee, "Incorrect entry fee");
        require(players.length < maxPlayers, "Lottery is full");

        players.push(payable(msg.sender));
        emit PlayerJoined(msg.sender);

        // Check if enough players joined, request randomness
        if (players.length == maxPlayers) {
            IVRFv2Consumer(vrfconsumer).requestRandomWords();
        }
    }

    function selectWinner() external {                      
        address payable _winner = players[randomNumber];
        _winner.transfer(address(this).balance);
        lotteryOpen = false;
        winner = _winner;
        emit WinnerPicked(_winner);
    }

    // Function to allow restarting the lottery (for testing)
    function resetLottery() public onlyAuthorized() {
        require(!lotteryOpen, "Lottery is currently running");
        delete players;
        randomNumber = 0;
        lotteryOpen = true;
    }
}
