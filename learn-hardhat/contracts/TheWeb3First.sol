// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract TheWeb3First {

  uint256 public number;

  constructor() {
    number = 1000;
  }

  function add(uint256 a, uint256 b) public pure returns (uint256){
    return a + b;
  }


  function mul(uint256 a, uint256 b) public pure returns (uint256){
    return a * b;
  }

  function sub(uint256 a, uint256 b) public pure returns (uint256) {
    return  a - b;
  }

  function div(uint256 a, uint256 b) public pure returns (uint256) {
    return  a / b;
  }

  function returnNumber() public view returns (uint256){
    return number;
  }
}
