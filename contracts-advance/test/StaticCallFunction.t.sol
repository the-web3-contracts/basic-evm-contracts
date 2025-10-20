// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {StaticCallFunction, StaticCallerFunction} from "../src/StaticCallFuntion.sol";


contract StaticCallFunctionTest is Test {
    StaticCallFunction public staticCallFunction;
    StaticCallerFunction public staticCallerFunction;

    function setUp() public {
        staticCallFunction = new StaticCallFunction();
        staticCallerFunction = new StaticCallerFunction();
    }

    function test_ReadNumber() public {
        staticCallFunction.setNumber(1000);
        console.log("==staticCaller's Number===");
        uint256 value = staticCallerFunction.readNumber(address(staticCallFunction));
        console.log("value=====", value);
        console.log("==staticCaller's Number===");
    }

    function testFuzz_SetNumber() public {
        staticCallerFunction.callSetNumber(address(staticCallFunction), 10000);
        uint256 staticCallNumber = staticCallFunction.number();
        uint256 staticCallerNumber = staticCallerFunction.number();
        console.log("staticCallNumber=", staticCallNumber);
        console.log("staticCallerNumber=", staticCallerNumber);
    }
}
