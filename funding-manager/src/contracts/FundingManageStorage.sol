// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;



abstract contract FundingManageStorage {

    address public constant NativeTokenAddress = address(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);

    address public managerAddress;

    mapping(address => uint256) public fundingBalance;
    mapping(address => bool) public supportToken;

    uint256[100] private placeHolder;
}
