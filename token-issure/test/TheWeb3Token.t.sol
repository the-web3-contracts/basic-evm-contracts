// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Test, console } from "forge-std/Test.sol";
import { TheWeb3Token } from "../src/TheWeb3Token.sol";

contract TheWeb3TokenTest is Test {
    TheWeb3Token public theWeb3Token;

    function setUp() public {
        theWeb3Token = new TheWeb3Token();
    }

    function test_XXX() public {
        console.log("test function");
    }
}
