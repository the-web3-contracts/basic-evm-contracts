// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CommonUse, CommonUseOne} from "../src/CommonUse.sol";


contract CommonUseTest is Test {
    CommonUse public commonUse;
    CommonUseOne public commonUseOne;

    function setUp() public {
        commonUseOne = new CommonUseOne();
        commonUse = new CommonUse(address(commonUseOne));
    }

    function test_incrementAgain() public {
        console.log("CommonUseTest tx.origin==", tx.origin);
        console.log("CommonUseTest address-this", address(this));
        console.log("CommonUseTest msg.sender==", msg.sender);
        commonUse.incrementAgain();
    }
}
