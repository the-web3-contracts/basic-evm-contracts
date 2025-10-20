// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { console} from "forge-std/Test.sol";

contract TargetContract {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}

contract TargetContractOne {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}


contract MultiCall {
    struct Call {
        address targetAddress;
        bytes callData;
    }

    // 最重要的问题，无限 for 循环可能存在
    // - gas 消耗很大
    // - 区块链区块大小是有现在，不懂的用户 calls 传得很多，会撑破区块
    function multicall(Call[] memory calls) public {
        for(uint256 i = 0; i < calls.length; i++) {
            (bool success, ) = calls[i].targetAddress.call(calls[i].callData);
            require(success, "call item failed");
        }
    }
}


contract MultiCaller {
    MultiCall public multiCall;

    constructor(address _multiCall){
        multiCall = MultiCall(_multiCall);
    }

    function setNumbers(address target, uint256 number, address targetOne, uint256 numberOne) public {
        console.log("target==", target);
        console.log("data==", number);
        console.log("targetOne==", targetOne);
        console.log("dataOne==", numberOne);

        MultiCall.Call[] memory calls = new MultiCall.Call[](2);

        calls[0] = MultiCall.Call({
            targetAddress: target,
            callData: abi.encodeWithSignature("setNumber(uint256)", number)
        });

        calls[1] = MultiCall.Call({
            targetAddress: targetOne,
            callData: abi.encodeWithSignature("setNumber(uint256)", numberOne)
        });

        multiCall.multicall(calls);

    }
}
