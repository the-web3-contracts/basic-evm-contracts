// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


interface InterfaceType{
    function getValue() external view returns (uint256);
    function setValue(uint256 _value) external;
}

contract InterfaceImplement is InterfaceType {
    uint256 public value;

    function getValue() public view returns (uint256) {
        return value;
    }

    function setValue(uint256 _value) public {
        value = _value;
    }
}
