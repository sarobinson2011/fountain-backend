// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface ILottery {
    function setVrfConsumer(address _vrfconsumer) external;
    function joinLottery() payable external;
    function selectWinner(uint256[] memory _randomWords) external;
    function returnWinner() external;
    function resetLottery() external;
}

