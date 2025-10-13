// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import { AddressTypeData } from "../src/contracts/AddressTypeData.sol";

contract AddressTypeTest is Test {
    AddressTypeData public addressType;

    function setUp() public {
        addressType = new AddressTypeData(payable(0x45Bd8ea16cFEB0D937a2D98cBEb0300e3E689Fe7));
        // vm.deal(address(addressType), 10 ether);
    }

    function test_setAddress() public {
        address rctAddressBefore = addressType.receiptAddress();
        console.log(rctAddressBefore);
        addressType.setAddress(payable(msg.sender));
        address rctAddressAfter = addressType.receiptAddress();
        console.log(rctAddressAfter);
    }

    function test_addressBalance() public {
        uint256 addrBalance = addressType.addressBalance();
        console.log(addrBalance);
    }

    function test_withdrawNativeTokenWithSend() public {
        addressType.withdrawNativeTokenWithSend();
    }

    function test_withdrawNativeTokenWithTransfer() public {
        addressType.withdrawNativeTokenWithTransfer();
    }

    function test_withdrawNativeTokenWithCall() public {
        addressType.withdrawNativeTokenWithCall();
    }
}
