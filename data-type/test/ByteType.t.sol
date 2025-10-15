// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ByteType} from "../src/contracts/ByteType.sol";

contract ByteTypeTest is Test {
    ByteType public byteType;

    function setUp() public {
        byteType = new ByteType();
    }

    function test_getByte2Length() public {
        uint256 length = byteType.getByte2Length();
        console.log(length);
    }

    function test_getBytesIndex() public { // 新版本里面 byte 已废弃，从 0.8.0 之后废弃
        bytes1 bt = byteType.getBytesIndex(1);
    }

    function test_compareArrays() public {
        bool isOk = byteType.compareArrays();
    }
}
