// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/contracts/StructType.sol";

contract StructTypeTest is Test {
    StructType structType;

    function setUp() public {
        structType = new StructType();
    }

    function testSetPerson() public {
        // 调用 setPerson
        structType.setPerson(unicode"Alice", 25, address(0x123));

        // 获取基本信息
        (string memory name, uint256 age, address wallet) = structType.getUser();
        assertEq(name, unicode"Alice");
        assertEq(age, 25);
        assertEq(wallet, address(0x123));

        // 获取完整结构体信息
        StructType.Person memory p = structType.getUserAllInfo();
        assertEq(p.info.university, unicode"深圳大学");
        assertEq(p.info.hometown, unicode"湖南(xxx)");
        assertEq(p.info.homeAddress, unicode"深圳龙华");
    }

    function testSetPersonTwo() public {
        // 使用 setPersonTwo
        structType.setPersonTwo();

        (string memory name, uint256 age, address wallet) = structType.getUser2();
        assertEq(name, unicode"zhangsan");
        assertEq(age, 100);
        assertEq(wallet, address(this)); // msg.sender 是当前测试合约

        // 验证 info
        StructType.PersonInfo memory info = structType.getUserInfo();
        assertEq(info.university, unicode"深圳大学");
        assertEq(info.hometown, unicode"湖南(xxx)");
        assertEq(info.homeAddress, unicode"深圳龙华");
    }
}
