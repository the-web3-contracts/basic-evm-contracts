// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract StaticCallFunction {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}


contract StaticCallerFunction  {
    uint256 public number;

    // don't support
    function callSetNumber(address _target, uint256 _umber) public {
        (bool success, ) = _target.staticcall(
            abi.encodeWithSignature("setNumber(uint256)", _umber)
        );
        require(success, "call set number fail");
    }

    function readNumber(address _target) public view returns (uint256) {
        bytes memory data = abi.encodeWithSignature("number()");
        (bool success, bytes memory result) = _target.staticcall(data);
        require(success, "Staticcall failed");
         return abi.decode(result, (uint256));
    }
}
