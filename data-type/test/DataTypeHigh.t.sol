// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {DataTypeHigh} from "../src/contracts/DataTypeHigh.sol";

contract DataTypeHighTest is Test {
    DataTypeHigh public dataTypeHigh;

    function setUp() public {
        dataTypeHigh = new DataTypeHigh();
        // dataTypeHigh.setNumber(10, 20); 减法会溢出，直接抛出错误
        dataTypeHigh.setNumber(100, 20);
    }

    function test_add() public {
        uint256 result = dataTypeHigh.add();
        console.log(result);
    }

    function test_sub() public {
        uint256 result = dataTypeHigh.sub();
        console.log(result);
    }

    function test_mul() public {
        uint256 result = dataTypeHigh.mul();
        console.log(result);
    }

    function test_div() public {
        uint256 result = dataTypeHigh.div();
        console.log(result);
    }

    function test_mod() public {
        uint256 result = dataTypeHigh.mod();
        console.log(result);
    }

    function test_mi() public {
        uint256 result = dataTypeHigh.mi();
        console.log(result);
    }
}
