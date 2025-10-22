// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";


contract FunctionSelector is Test{
    function setUp() public {

    }

    function test_XXXXX() public {
        bytes4 selector = bytes4(keccak256("transfer(address,uint256)"));
        console.logBytes4(selector);

        bytes4 selectorOne = bytes4(keccak256("depositETH()"));
        console.logBytes4(selectorOne);

        bytes4 selectorTwo = bytes4(keccak256("setValue(uint256)"));
        console.logBytes4(selectorTwo);

        bytes memory abiCodeOne = abi.encodeWithSelector(bytes4(keccak256("setValue(uint256,string)")), 10, "hello the web3");
        console.logBytes(abiCodeOne);

        bytes memory abiCodeTwo = abi.encodeWithSignature("setValue(uint256,string)", 10, "hello the web3");
        console.logBytes(abiCodeTwo);

        uint256 aaa = 10;
        string memory bbb = "hello the web3";
        bytes memory abiCodeThree = abi.encodePacked(aaa, bbb);
        console.logBytes(abiCodeThree);

        bytes memory abiCodeFour = abi.encode(aaa, bbb);
        console.logBytes(abiCodeFour);
    }
}
