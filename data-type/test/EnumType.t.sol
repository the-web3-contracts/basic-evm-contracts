// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/contracts/EnumType.sol";

contract EnumTypeTest is Test {
    EnumType enumType;

    function setUp() public {
        enumType = new EnumType();
    }

    function testSetAndGetBettorType() public {
        // 设置为 Big
        enumType.setBettorType(EnumType.BettorType.Big);
        EnumType.BettorType bt = enumType.bettorType();
        assertEq(uint8(bt), 0, "BettorType should be Big (0)");

        // 设置为 Small
        enumType.setBettorType(EnumType.BettorType.Small);
        bt = enumType.bettorType();
        assertEq(uint8(bt), 1, "BettorType should be Small (1)");
    }

    function testGetBettorBigType() public {
        uint8 bigType = enumType.getBettorBigType();
        assertEq(bigType, 0, "Big type should be 0");
    }

    function testGetBettorSmallType() public {
        uint8 smallType = enumType.getBettorSmallType();
        assertEq(smallType, 1, "Small type should be 1");
    }

    function testGetBettorSingleType() public {
        uint8 singleType = enumType.getBettorSingleType();
        console.log("=============");
        console.log(singleType);
        console.log("=============");
        assertEq(singleType, 2, "Single type should be 2");
    }
}
