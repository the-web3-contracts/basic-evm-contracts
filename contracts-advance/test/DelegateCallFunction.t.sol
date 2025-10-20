// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {DelegateCallFunctionImplement, DelegateCallFunction} from "../src/DelegateCallFunction.sol";


contract DelegateCallFunctionTest is Test {
    DelegateCallFunction public delegateCallFunction;
    DelegateCallFunctionImplement public delegateCallFunctionImplement;

    function setUp() public {
        delegateCallFunction = new DelegateCallFunction();
        delegateCallFunctionImplement = new DelegateCallFunctionImplement();
    }

    function test_Increment() public {
        delegateCallFunctionImplement.callIncrement(address(delegateCallFunction));
        uint256 delegateCallNumber = delegateCallFunction.number();
        uint256 delegateCallImplementNumber = delegateCallFunctionImplement.number();
        console.log("delegateCallNumber=", delegateCallNumber);
        console.log("delegateCallImplementNumber=", delegateCallImplementNumber);
    }

    function testFuzz_SetNumber() public {
        delegateCallFunctionImplement.callSetNumber(address(delegateCallFunction), 10000);
        uint256 delegateCallNumber = delegateCallFunction.number();
        uint256 delegateCallImplementNumber = delegateCallFunctionImplement.number();
        console.log("delegateCallNumber=", delegateCallNumber);
        console.log("delegateCallImplementNumber=", delegateCallImplementNumber);
    }
}
