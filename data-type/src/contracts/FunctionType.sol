// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract FunctionType {
    constructor(){

    }

    function add(uint256 a, uint256 b) public view returns(uint256) {
        a++;
        b++;
        return a + b;
    }
}
