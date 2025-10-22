// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IGamblingGameManager {
    enum BettorType {
        Big,            // 大  0
        Small,          // 小
        Single,         // 单
        Double          // 双
    }

    struct RoundGame {
       uint256 startBlock;
       uint256 endBlock;
       uint[3] threeNumbers;
    }

    struct GuessBettor {
        address account;
        uint256 value;
        uint256 hgmId;
        uint8 betType;
        bool hasReward;
        bool isReward;
        uint256 rewardValue;
    }

    event GuessBettorCreate(
        address account,
        uint256 value,
        uint16 betType
    );

    event AllocateRward(
        address indexed account,
        uint256  hgmId,
        uint8   betType,
        uint256 reWardVale,
        bool   hasReward
    );

    function createBettor(uint256 _amount, uint8 _betType) external returns (bool);
    function luckyDraw(uint256[3] memory _threeNumbers) external;
    function setGameBlock(uint256 _block) external;
    function setBetteToken(address _betteToken, uint256 _betteTokenDecimal) external;
    function getBalance() external view returns (uint256);
}
