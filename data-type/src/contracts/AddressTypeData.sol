// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract AddressTypeData {
    address payable public receiptAddress;

    receive() external payable {
    }

    constructor(address payable _receiptAddress) {
        receiptAddress  = _receiptAddress;
    }

    function setAddress(address payable _receiptAddress) public {
        receiptAddress  = _receiptAddress;
    }

    function addressBalance() public view returns (uint256) {
        return receiptAddress.balance;
    }

    function withdrawNativeTokenWithSend() public payable {
        bool success = receiptAddress.send(1 ether);
        require(success, "transfer success");
    }

    function withdrawNativeTokenWithTransfer() public payable{
        receiptAddress.transfer(1 ether);
    }

    function withdrawNativeTokenWithCall() public payable {
        (bool success, ) = receiptAddress.call{value: 1 ether}("");
        require(success, "transfer success");
    }
}
