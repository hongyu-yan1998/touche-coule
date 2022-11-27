// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import 'hardhat/console.sol';
import './Ship.sol';

contract Battleship is Ship {
    struct BattleShip {
        uint x;
        uint y;
    }

    BattleShip private battleShip;
    uint private widthGame;
    uint private heightGame;

    function update(uint x, uint y) public override {
        battleShip.x = x;
        battleShip.y = y;
    }

    function fire() public override returns (uint, uint) {
        uint _x = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % widthGame;
        uint _y = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % heightGame;
        return(_x, _y);
    }
    
    function place(uint width, uint height) public override returns (uint, uint) {
        widthGame = width;
        heightGame = height;
        battleShip.x = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % width;
        battleShip.y = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % height;
        return(battleShip.x, battleShip.y);
    }
}