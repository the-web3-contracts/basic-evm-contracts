// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../interfaces/IGamblingGameManager.sol";

abstract contract GamblingGameStorage is IGamblingGameManager {
    address public betteToken;                              // 博彩 Token(USDT)
    uint256 public gameBlock;                                // 游戏的每期块的数量，默认 30，可以设置
    uint256 public hgmGlobalId;                              // 每一期游戏的 Id, 从 1 开始递增, 查看开始游戏函数
    address public luckyDrawer;
    uint256 public betteTokenDecimal;

    GuessBettor[] public guessBettorList;                       // 博彩人数

    mapping(uint256 => RoundGame) public roundGameInfo;         // 每期的结果
    mapping(uint256 => mapping(address => GuessBettor)) public GuessBettorMap;     // 玩家的历史记录
}
