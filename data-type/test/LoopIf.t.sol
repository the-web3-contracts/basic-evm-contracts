// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/contracts/LoopIf.sol";

contract LoopIfTest is Test {
    LoopIf loopIf;

    function setUp() public {
        loopIf = new LoopIf();
    }

    function testSumFor_n10() public {
        uint256 n = 10;
        uint256 expected = 55;
        assertEq(loopIf.sumFor(n), expected);
    }

    function testSumWhile_n10() public {
        uint256 n = 10;
        uint256 expected = 55;
        assertEq(loopIf.sumWhile(n), expected);
    }

    function testSumFor_n0_and_sumWhile_n0() public {
        assertEq(loopIf.sumFor(0), 0);
        assertEq(loopIf.sumWhile(0), 0);
    }

    function testDoWhileRepeat_times3() public {
        assertEq(loopIf.doWhileRepeat(3), 3);
    }

    function testDoWhileRepeat_times0() public {
        assertEq(loopIf.doWhileRepeat(0), 1);
    }

    function testFindFirstGreater_found() public {
        uint256[] memory arr;
        arr[0] = 1;
        arr[1] = 3;
        arr[2] = 5;
        arr[3] = 7;
        arr[4] = 9;

        (bool found, uint256 index) = loopIf.findFirstGreater(arr, 4);
        assertTrue(found);
        assertEq(index, 2);
    }

    function testFindFirstGreater_notFound() public {
        uint256[] memory arr;
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;

        (bool found, uint256 index) = loopIf.findFirstGreater(arr, 10);
        assertFalse(found);
        assertEq(index, type(uint256).max);
    }

    function testClassify_negative() public {
        assertEq(loopIf.classify(-5), "negative");
    }

    function testClassify_zero() public {
        assertEq(loopIf.classify(0), "zero");
    }

    function testClassify_small() public {
        assertEq(loopIf.classify(7), "small");
    }

    function testClassify_large() public {
        assertEq(loopIf.classify(100), "large");
    }
}
