// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import { OneContract } from "../src/contracts/AbstractContract.sol";
contract AbstractContractTest is Test {
    OneContract public oneCt;

    function setUp() public {
        oneCt = new OneContract();
    }

    function test_setValueOne() public {
        oneCt.setValueOne(100);
        oneCt.setValue(1000);
        oneCt.getValue();
    }
}
