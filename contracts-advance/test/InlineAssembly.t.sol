// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import { InlineAssemblyExample } from "../src/InlineAssemblyExample.sol";


contract InlineAssemblyTest is Test {
    InlineAssemblyExample public inlineAssemblyExample;

    function setUp() public {
        inlineAssemblyExample = new InlineAssemblyExample();
    }

    function test_AssemblyAdd() public {
        inlineAssemblyExample.addNumbers(10, 20);
    }

    function test_ReadWriteMemory() public {
        inlineAssemblyExample.readWriteMemory(1000);
    }


    function test_SetAndGet() public {
        inlineAssemblyExample.setAndGet(1000);
        console.log(inlineAssemblyExample.dataOne());
        console.log(inlineAssemblyExample.dataTwo());
    }

    function test_getSelector() public {
        inlineAssemblyExample.getSelector();

        bytes4 selectorData = bytes4(keccak256("addNumbers(uint256,uint256)"));
        console.logBytes4(selectorData);

        bytes4 selectorData1 = bytes4(keccak256("readWriteMemory(uint256)"));
        console.logBytes4(selectorData1);

        bytes4 selectorData2 = bytes4(keccak256("setAndGet(uint256)"));
        console.logBytes4(selectorData2);

        bytes4 selectorData3 = bytes4(keccak256("getSelector()"));
        console.logBytes4(selectorData3);
    }

    function test_CreateArray() public {
        uint256[] memory xxx = inlineAssemblyExample.createArray(1);
        console.log("xxx length===", xxx.length);
    }

}
