// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

import "./LuckyDrawerStorage.sol";

contract LuckyDrawerManager is LuckyDrawerStorage, Initializable, OwnableUpgradeable, ReentrancyGuardUpgradeable  {
    constructor(){
        _disableInitializers();
    }

    function initialize(address initialOwner, IGamblingGameManager _gameManager) public initializer {
        __Ownable_init(initialOwner);
        gameManager = _gameManager;
    }

    function callOracle() external {
        // 调度 oracle 的某一个地址拿到 3 个随机数字，
        uint256[3] memory oracleNumbers;
        oracleNumbers[0] = 3;
        oracleNumbers[1] = 9;
        oracleNumbers[2] = 4;

        gameManager.luckyDraw(oracleNumbers);
    }

}
