// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ArrayType {

    uint256[] public dynamicArray;

    uint256[5] public fixedArray;

    function getDynamicArrayLength() public view returns (uint256) {
        return dynamicArray.length;
    }

    function getFixedArrayLength() public view returns (uint256) {
        return fixedArray.length;
    }

    function setFixedArray() public  {
        fixedArray[0] = 1;
        fixedArray[1] = 2;
        fixedArray[2] = 3;
        fixedArray[3] = 4;
    }

    function pushElementToDynamicArray(uint256 value) public  {
        dynamicArray.push(value);
    }

    function getElementFromDynamicArray(uint256 index) public view returns (uint256)  {
        return dynamicArray[index];
    }

    function getElementFromFixedArray(uint256 index) public view returns (uint256)  {
        return fixedArray[index];
    }

    function popElementFromDynamicArray() public  {
        dynamicArray.pop();
    }

    function deletemDynamicArray() public  {
        delete dynamicArray;
    }
}
