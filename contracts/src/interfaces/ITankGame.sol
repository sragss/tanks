// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Board } from "src/interfaces/IBoard.sol";

interface ITankGame {
    struct GameSettings {
        uint256 playerCount;
        uint256 boardSize;
        uint256 initAPs;
        uint256 initHearts;
        uint256 initShootRange;
        uint256 epochSeconds;
        uint256 buyInMinimum;
        uint256 revealWaitBlocks;
        bytes32 root;
    }

    struct Tank {
        address owner;
        uint256 hearts;
        uint256 aps;
        uint256 range;
    }

    enum GameState {
        WaitingForPlayers,
        Started,
        Ended
    }

    function join(bytes32[] memory proof) external payable;

    function move(uint256 fromId, Board.Point calldata to) external;

    function shoot(uint256 fromId, uint256 toId, uint256 shots) external;

    function give(uint256 fromId, uint256 toId, uint256 hearts, uint256 aps) external;

    function upgrade(uint256 tankId) external;

    function vote(uint256 voter, uint256 cursed) external;

    function claim(uint256 tankId, address claimer) external;

    function delegate(uint256 tankId, address delegatee) external;

    function reveal() external;

    function getPlayerCount() external view returns (uint256);

    function getTank(uint256 tankId) external view returns (Tank memory);

    function getBoard() external view returns (Board);

    function getSettings() external view returns (GameSettings memory);

    function getLastDrip(uint256 tankId) external view returns (uint256);
}
