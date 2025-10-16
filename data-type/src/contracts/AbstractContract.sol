// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

abstract contract AbstractContract {
    uint256 public value;

    function getValue() public view virtual returns (uint) {
        return 100;
    }

    function setValue(uint _value) public  {
        value = _value;
    }
}

contract OneContract is AbstractContract {
    function getValue() public view override returns (uint) {
        return value;
    }

    function setValueOne(uint _value) public  {
       setValue(_value);
    }
}
