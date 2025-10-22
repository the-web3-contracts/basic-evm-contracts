// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract InlineAssemblyExample {
    uint256 public dataOne; // 0 slot
    uint256 public dataTwo; // 1 slot


    function addNumbers(uint256 a, uint256 b) public pure returns (uint256 result) {
        assembly {
            result := add(a, b)  // evm op-code 的 ADD 的 CODE
        }
    }

    function readWriteMemory(uint256 input) public pure returns (uint256 output) {
        assembly {
            let pointer := mload(0x40) // 获取内存的空闲位置
            mstore(pointer, input)     // 将 input 写入内存
            output := mload(pointer)   // 从内存读取值
        }
    }

    function setAndGet(uint256 value) public returns (uint256) {
        assembly {
            sstore(1, value)  // 将 value 存储到 slot 0
            let result := sload(0)  // 从 slot 0 加载值
            return(0, 32)     // 返回值（32 字节）
        }
    }

    function getSelector() public pure returns (bytes4 selector) {
        assembly {
            selector := calldataload(0) // 从 calldata 中读取前 4 字节（函数选择器）
        }
    }

    function createArray(uint256 size) public pure returns (uint256[] memory) {
        assembly {
            let ptr := mload(0x40)     // 获取空闲内存位置
            mstore(ptr, size)         // 设置数组长度
            let data := add(ptr, 0x20) // 指向数组内容区域
            for { let i := 0 } lt(i, size) { i := add(i, 1) } {
                mstore(add(data, mul(i, 0x20)), i) // 存储数组元素
            }
            mstore(0x40, add(data, mul(size, 0x20))) // 更新空闲内存指针
            return(ptr, add(0x20, mul(size, 0x20))) // 返回数组
        }
    }
}
