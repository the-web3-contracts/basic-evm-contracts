// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract DataTypeBool {
    bool public isActiveA;
    bool public isActiveB;

    function setActive(bool _isActiveA, bool _isActiveB) public {
        isActiveA = _isActiveA;
        isActiveB = _isActiveB;
    }

    function retAAndB() public view returns(bool){
        return isActiveA && isActiveB;
    }

    function retBAndA() public view returns(bool){
        return isActiveB && isActiveA;
    }

    function retAOrB() public view returns(bool){
        return isActiveA || isActiveB;
    }

    function retBOrA() public view returns(bool){
        return isActiveB || isActiveA;
    }

    function retNotA() public view returns(bool){
        return !isActiveA;
    }

    function retNotB() public view returns(bool){
        return !isActiveB;
    }
}
