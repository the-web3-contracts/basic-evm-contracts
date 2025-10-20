// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract PlaceHolder {
    uint256 public a;
    uint256 public c;
    uint256 public d;
    uint256 public dd;
    uint256 public eee;


    uint256[99] private slot;
}


contract PlaceHolderOne {
    uint256 public e;
    uint256 public f;
    uint256 public g;

    uint256[100] private pppp;
}


contract PlaceHolderThree {
    uint256 public h;
    uint256 public i;
    uint256 public j;

    uint256[100] private pppp;
}


contract PlaceHolderAll is PlaceHolder, PlaceHolderOne, PlaceHolderThree{
    uint256 public x;
    uint256 public xx;
    uint256 public xxx;
}
