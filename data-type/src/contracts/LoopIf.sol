// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract LoopIf {
    function sumFor(uint256 n) external pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 1; i <= n; i++) {
            sum += i;
        }
        return sum;
    }

    function sumWhile(uint256 n) external pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 1;
        while (i <= n) {
            sum += i;
            i++;
        }
        return sum;
    }

    function doWhileRepeat(uint256 times) external pure returns (uint256) {
        uint256 i = 0;
        uint256 count = 0;
        do {
            count++;
            i++;
        } while (i < times);
        return count;
    }

    function findFirstGreater(uint256[] memory arr, uint256 target) external pure returns (bool found, uint256 index) {
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] > target) {
                return (true, i);
            } else if (arr[i] == target) {
                continue;
            } else {
                continue;
            }
        }
        return (false, type(uint256).max);
    }

    function classify(int256 x) external pure returns (string memory) {
        bool done = false;
        string memory result = "";
        while (!done) {
            if (x < 0) {
                result = "negative";
                done = true;
            } else if (x == 0) {
                result = "zero";
                done = true;
            } else if (x <= 10) {
                result = "small";
                done = true;
            } else {
                result = "large";
                done = true;
            }
        }
        return result;
    }
}
