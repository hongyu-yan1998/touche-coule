// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import 'hardhat/console.sol';
import './Ship.sol';

contract Destroyer is Ship {
    struct DestroyerShip {
        uint x;
        uint y;
    }

    DestroyerShip private destroyerShip;
    uint private widthGame;
    uint private heightGame;

    function update(uint x, uint y) public override {
        destroyerShip.x = x;
        destroyerShip.y = y;
    }

    function fire() public override returns (uint, uint) {
        uint x_ = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % widthGame;
        uint y_ = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % heightGame;
        while (destroyerShip.x == x_ && destroyerShip.y == y_) {
            x_ = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % widthGame;
            y_ = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % heightGame;
        }
        return(x_, y_);
    }
    
    function place(uint width, uint height) public override returns (uint, uint) {
        widthGame = width;
        heightGame = height;
        destroyerShip.x = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % width;
        destroyerShip.y = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % height;
        return(destroyerShip.x, destroyerShip.y);
    }
}