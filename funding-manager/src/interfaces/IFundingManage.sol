// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

interface IFundingManage {
    event SetSupportToken(
        address indexed tokenAddress,
        bool isSupport
    );

    event SetManagerAddress(
        address oldAddress,
        address newAddress
    );

    event DepositToken(
        address indexed tokenAddress,
        address indexed sender,
        uint256 amount
    );

    event WithdrawToken(
        address indexed tokenAddress,
        address sender,
        address withdrawAddress,
        uint256 amount
    );


    function depositNativeToken() external payable;
    function depositErc20Token(address _tokenAddress, uint256 _tokenAmount) external;
    function withdrawNativeToken(address payable withdrawAddress, uint256 amount) external payable;
    function withdrawErc20Token(address withdrawAddress, address tokenAddress, uint256 amount) external;
    function setSupportToken(address _tokenAddress, bool _isSupport) external;
    function setManagerAddress(address _managerAddress) external;
}
