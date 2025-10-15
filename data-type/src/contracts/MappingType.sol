// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MappingType {
    struct PersonInfo {
        string university;
        string hometown;
        string homeAddress;
    }

    PersonInfo public userInfo;

    mapping(address=> mapping(uint256 => uint256[])) public keyAddress;

}
