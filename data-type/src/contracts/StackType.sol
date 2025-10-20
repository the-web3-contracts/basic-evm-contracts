// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract StackType {
    function complexFunction(uint a, uint b, uint c, uint d, uint e, uint f, uint g) public pure {
        uint h = a + b + c + d + e + f + g + a + b + c + d + e + f + g;
    }
}
