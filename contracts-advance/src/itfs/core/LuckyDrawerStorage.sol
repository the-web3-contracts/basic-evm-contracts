// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../interfaces/ILuckyDrawerManager.sol";
import "../interfaces/IGamblingGameManager.sol";


abstract contract LuckyDrawerStorage is ILuckyDrawerManager{
    IGamblingGameManager public gameManager;
}
