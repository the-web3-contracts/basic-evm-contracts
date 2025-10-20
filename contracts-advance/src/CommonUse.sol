// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { console} from "forge-std/Test.sol";


contract CommonUseOne {
    uint256 public number;

    function increment() public {
        console.log("CommonUseOne address-this===", address(this));
        console.log("CommonUseOne tx.origin====", tx.origin);
        console.log("CommonUseOne msg.sender===", msg.sender);
        number++;
    }
}

contract CommonUse is CommonUseOne{
    address public commonUseOne;
    constructor(address _commonUseOne){
        commonUseOne = _commonUseOne;
    }

    function incrementAgain() public {
        console.log("CommonUse tx.origin==", tx.origin);
        console.log("CommonUse msg.sender===", msg.sender);
        console.log("CommonUse address-this===", address(this));
        CommonUseOne(commonUseOne).increment();
    }
}
