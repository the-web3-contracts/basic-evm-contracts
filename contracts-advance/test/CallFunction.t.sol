// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CallFunctionImplement, CallFunction} from "../src/CallFunction.sol";

contract CounterTest is Test {
    CallFunction public callFunction;
    CallFunctionImplement public callFunctionImplement;

    function setUp() public {
        callFunction = new CallFunction();
        callFunctionImplement = new CallFunctionImplement();
    }

    function test_Increment() public {
        callFunctionImplement.callIncrement(address(callFunction));
        callFunction.number();
    }

    function testFuzz_SetNumber(uint256 x) public {
        callFunctionImplement.callSetNumber(address(callFunction), 10000);
        callFunction.number();
    }
}
