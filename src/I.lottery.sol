// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface ILottery {
    function setVrfConsumer(address _vrfconsumer) external;
    function joinLottery() external;
    function selectWinner() external;
    function resetLottery() external;
}

