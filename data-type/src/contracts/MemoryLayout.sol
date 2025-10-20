// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MemoryLayout {
    constructor(){

    }
    /*
     * uint256: 32 字节
     * uint8: 1 个字节
     * bool: 1 个字节
     * address: 20 个字节
     * string: 占据空间长度取决于字符串
    */

    uint256 public a;  // slot 0
    uint128 public b;  // slot 1
    uint128 public c;  // slot 1
    address public addr; // slot 2
    uint96 public e;    // slot 2

    uint8 public f;  // slot 3


    string public str = "eeeeeeeeeeee"; // slot4

    struct PersonInfo {
        uint256 aaa;
        uint128 bbbb;
        uint256 ccc;
        uint256 dddd;
    }

    PersonInfo public person; // slot 5 6 7 8
    PersonInfo public personTwo; // slot 9 10 11 12
    PersonInfo public personThree; // slot 13 14 15 16

    uint256[3] public defThree;  //slot 17 18 19
    uint256[] public def;   // slot 20 这个 slot 仅仅一个数据的长度
    uint128 public cfr;  // slot 21

    uint256 public acerefff;  // slot 22

    mapping(uint256 => address) public cccccee; // 23

    mapping(uint256 => uint256[3]) public ccccceef; // 24

    uint256 public acere;  // slot 25

    bytes32 public acerefffone;  // slot 26

    bytes32 public acerefffeee;  // slot 27

    bytes1 public acerefffeee1;  // slot 28

    bytes1 public acerefffeee2;  // slot 28

    bytes1 public acerefffeee3;  // slot 28

    bytes30 public acerefffeee4;  // slot 29

    function pushDanymicArray() public {
        def.push(10);
        def.push(20);
        def.push(30);
    }
}
