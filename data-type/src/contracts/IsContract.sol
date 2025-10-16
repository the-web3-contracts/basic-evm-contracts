// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

abstract contract IsAbstractContract {
    address public manageAddress;

    constructor(address _manageAddress){
        manageAddress = _manageAddress;
    }

    function getAddress() public view virtual returns (address) {
        return manageAddress;
    }
}

interface InterfaceContract{
    function setOperatorAddress(address _operatorAddress) external;
    function setManagerAddress(address _operatorAddress) external;
}

contract MyContract {
    uint256 public value;

    function getValue() public view returns (uint256) {
        return value;
    }

    function setValue(uint256 _value) public {
        value = _value;
    }
}

contract ContractImplement is IsAbstractContract, InterfaceContract, MyContract {
    address public operatorAddress;

    constructor (
        address _manageAddress,
        address _operatorAddress
    ) IsAbstractContract(_manageAddress) {
        operatorAddress = _operatorAddress;
    }

    function setOperatorAddress(address _operatorAddress) external {
        operatorAddress = _operatorAddress;
    }

    function setManagerAddress(address _manageAddress) external {
        manageAddress = _manageAddress;
    }

    function getAddress() public view override returns (address) {
        return operatorAddress;
    }
}
