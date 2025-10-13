// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract DataTypeHigh {
    uint256 public a;
    uint256 public b;

    function setNumber(uint256 _a, uint256 _b) public {
        a = _a;
        b = _b;
    }

    function add() public view returns(uint256){
        return a + b;
    }

    function sub() public view returns(uint256){
        return a - b;
    }

    function mul() public view returns(uint256){
        return a * b;
    }

    function div() public view returns(uint256){
        return a / b;
    }

    function mod() public view returns(uint256){
        return a % b;
    }

    function mi() public view returns(uint256){
        return a ** b;
    }
}
