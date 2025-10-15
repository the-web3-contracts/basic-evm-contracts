// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract EnumType {

    enum BettorType {
        Big,
        Small,
        Single,
        Double
    }

    BettorType public bettorType;

    function setBettorType(BettorType _bettorType) public  {
        bettorType = _bettorType;
    }

    function getBettorBigType() public pure returns(uint8) {
        return uint8(BettorType.Big);
    }

    function getBettorSmallType() public pure returns(uint8) {
        return uint8(BettorType.Small);
    }

    function getBettorSingleType() public pure returns(uint8) {
        return uint8(BettorType.Single);
    }
}
