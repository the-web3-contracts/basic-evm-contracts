// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

import "./GamblingGameStorage.sol";

contract GamblingGameManager is GamblingGameStorage, Initializable, OwnableUpgradeable, ReentrancyGuardUpgradeable {
    using SafeERC20 for IERC20;

    modifier onlyLuckyDrawer()  {
        require(luckyDrawer == msg.sender, "GamblingGameManager:onlyLuckyDrawer: caller must be lucky drawer");
        _;
    }

    function initialize(address initialOwner, address _betteToken, address _luckyDrawer) public initializer {
        __Ownable_init(initialOwner);
        gameBlock = 32;
        hgmGlobalId = 1;
        betteTokenDecimal = 6;
        luckyDrawer = _luckyDrawer;
        betteToken = _betteToken;
        uint256[3] memory fixedArray;
        roundGameInfo[hgmGlobalId] = RoundGame(block.number, (block.number + gameBlock), fixedArray);
    }

    function createBettor(uint256 _amount, uint8 _betType) external returns (bool) {
        require(_betType >= uint8(BettorType.Big) && _betType <= uint8(BettorType.Double), "createBettor: invalid bettor type, please bette repeat");

        require(_amount >= 10 ** betteTokenDecimal, "GamblingGameManager:createBettor: bette amount must more than ten");

        require(IERC20(betteToken).balanceOf(msg.sender) >= _amount, "GamblingGameManager:createBettor: bettor account balance not enough");

        require(roundGameInfo[hgmGlobalId].endBlock >= block.number, "GamblingGameManager:createBettor: current round game is over, wait for next round game");

        IERC20(betteToken).safeTransferFrom(msg.sender, address(this), _amount);

        GuessBettor memory gb = GuessBettor({
            account: msg.sender,
            value: _amount,
            hgmId: hgmGlobalId,
            betType: _betType,
            hasReward: false,
            isReward: false,
            rewardValue: 0
        });

        guessBettorList.push(gb);

        emit GuessBettorCreate(msg.sender, _amount, _betType);

        return true;
    }

    function luckyDraw(uint256[3] memory _threeNumbers) external onlyLuckyDrawer {
        require(block.number  > roundGameInfo[hgmGlobalId].endBlock , "GamblingGameManager:luckyDraw: The game is not over yet");
        uint256 threeNumberResult  = 0;
        for (uint256 i = 0; i < _threeNumbers.length; i++) {
            threeNumberResult += _threeNumbers[i];
        }
        for(uint256 i = 0; i < guessBettorList.length; i++) {
            uint256 reWardVale  = guessBettorList[i].value * 195 / 100;
            if ((threeNumberResult >= 14 && threeNumberResult <= 27) && (guessBettorList[i].betType == uint8(BettorType.Big))) { // 大
                allocateReward(guessBettorList[i], reWardVale);
            }
            if (threeNumberResult >= 0 && threeNumberResult <= 13 && guessBettorList[i].betType == uint8(BettorType.Small)) { // 小
                allocateReward(guessBettorList[i], reWardVale);
            }
            if (threeNumberResult % 2 == 0  && guessBettorList[i].betType == uint8(BettorType.Double)) { // 双
                allocateReward(guessBettorList[i], reWardVale);
            }
            if (threeNumberResult % 2 != 0 && guessBettorList[i].betType == uint8(BettorType.Single)) {  // 单
                allocateReward(guessBettorList[i], reWardVale);
            }
        }
        roundGameInfo[hgmGlobalId].threeNumbers = _threeNumbers;
        delete guessBettorList;
        uint256[3] memory fixedArray;
        roundGameInfo[hgmGlobalId++] = RoundGame(block.number, block.number + gameBlock, fixedArray);
    }

    //============================== internal function ==============================
    function allocateReward(GuessBettor memory guessBettor, uint256 _reWardVale) internal {
        guessBettor.isReward = true;
        guessBettor.rewardValue = _reWardVale;

        IERC20(betteToken).safeTransfer(guessBettor.account, _reWardVale);

        guessBettor.hasReward = true;

        emit AllocateRward(
            guessBettor.account,
            hgmGlobalId,
            guessBettor.betType,
            _reWardVale,
            true
        );
    }

    function setGameBlock(uint256 _block) external onlyOwner {
        gameBlock = _block;
    }

    function setBetteToken(address _betteToken, uint256 _betteTokenDecimal) external onlyOwner {
        betteToken = _betteToken;
        betteTokenDecimal = _betteTokenDecimal;
    }

    function getBalance() external view returns (uint256) {
        return IERC20(betteToken).balanceOf(address(this));
    }
}
