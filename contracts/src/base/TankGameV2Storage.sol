// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { ITankGame } from "src/interfaces/ITankGame.sol";
import { Board } from "src/interfaces/IBoard.sol";

contract TankGameV2Storage {
    mapping(address player => uint256 tank) public players;
    mapping(uint256 tankId => ITankGame.Tank tank) public tanks;
    mapping(uint256 tankId => Board.Point point) public tankToPosition;
    mapping(uint256 position => uint256 heartCount) public heartsOnBoard;
    mapping(uint256 position => uint256 tankId) public tanksOnBoard;
    mapping(uint256 tankId => uint256 epoch) public lastDripEpoch;
    mapping(uint256 tankId => mapping(address delegate => bool isDelegate)) public delegates;

    mapping(uint256 epoch => mapping(uint256 tankId => uint256 votes)) public votesPerEpoch;
    mapping(uint256 epoch => bool votingClosed) public votingClosed;
    mapping(uint256 epoch => mapping(uint256 tankId => bool voted)) public votedThisEpoch;
    mapping(uint256 tankId => bool claimed) public claimed;
    uint256 public playersCount;
    uint256 public numTanksAlive;
    uint256 public prizePool;
    uint256 public epochStart;
    uint256[3] public podium;
    uint256[] public deadTanks;
    uint256 public aliveTanksIdSum;
    uint256 public revealBlock;
    uint256 public lastRevealBlock;
    ITankGame.GameState public state; // can calculate this
    ITankGame.GameSettings public settings;
    Board public board;
}
