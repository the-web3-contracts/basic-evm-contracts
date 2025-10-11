// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {TheWeb3First} from "../contracts/TheWeb3First.sol";
import "forge-std/src/Test.sol";

contract CounterTest is Test {
  TheWeb3First theWeb3First;

  function setUp() public {
    theWeb3First = new TheWeb3First();
  }

  function test_contractor() public view {
    require(theWeb3First.number() == 1000, "Initial value should be 1000");
  }

  function test_add() public view {
    require(theWeb3First.add(10, 10) == 20, "Initial value should be 20");
  }
}
