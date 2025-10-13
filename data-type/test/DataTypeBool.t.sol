// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {DataTypeBool} from "../src/contracts/DataTypeBool.sol";

contract DataTypeBoolTest is Test {
    DataTypeBool public dataType;

    function setUp() public {
        dataType = new DataTypeBool();
        dataType.setActive(true, false);
    }

    function test_retAAndB() public {
        bool result = dataType.retAAndB();
        console.log(result);
    }

    function test_retBAndA() public {
        bool result = dataType.retBAndA();
        console.log(result);
    }

    function test_retAOrB() public {
        bool result = dataType.retAOrB();
        console.log(result);
    }

    function test_retBOrA() public {
        bool result = dataType.retBOrA();
        console.log(result);
    }

    function test_retNotA() public {
        bool result = dataType.retNotA();
        console.log(result);
    }

    function test_retNotB() public {
        bool result = dataType.retNotB();
        console.log(result);
    }
}
