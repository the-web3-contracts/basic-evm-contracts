// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ByteType {
    bytes32 public bytes2Array1 = hex"abcdef";
    bytes32 public bytes2Array2 = hex"abcdef";


    function getByte2Length() public view returns(uint256) {
        return bytes2Array1.length;
    }

    function getBytesIndex(uint256 index) public view returns(bytes1) {
        require(index < bytes2Array1.length, "index out of bounds");
        return bytes2Array1[index];
    }

    function compareArrays() public view returns(bool) {
        return keccak256(abi.encodePacked(bytes2Array1)) == keccak256(abi.encodePacked(bytes2Array2));
    }
}
