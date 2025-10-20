// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract CallFunction {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}

contract CallFunctionImplement {
    function callSetNumber(address _target, uint256 _umber) public {
        (bool success, ) = _target.call(
            abi.encodeWithSignature("setNumber(uint256)", _umber)
        );
        require(success, "call set number fail");
    }

    function callIncrement(address _target) public {
        (bool success, ) = _target.call(
            abi.encodeWithSignature("increment()")
        );
        require(success, "call increment fail");
    }
}

