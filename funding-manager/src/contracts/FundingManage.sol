// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import  "../interfaces/IFundingManage.sol";
import  "./FundingManageStorage.sol";


contract FundingManage is Initializable, OwnableUpgradeable, ReentrancyGuardUpgradeable, PausableUpgradeable, IFundingManage, FundingManageStorage {
    using SafeERC20 for IERC20;

    modifier onlyManager() {
        require(
            msg.sender == address(managerAddress),
            "FundingManage:onlyManager only manager can call this function"
        );
        _;
    }

    constructor()  {
        _disableInitializers();
    }

    receive() external payable {
        fundingBalance[NativeTokenAddress] += msg.value;
    }

    function initialize(address initialOwner, address _managerAddress) public initializer {
        __Ownable_init(initialOwner);
        __ReentrancyGuard_init();
        managerAddress = _managerAddress;
    }

    function depositNativeToken() external payable {
        require(supportToken[NativeTokenAddress], "FunctionType:depositNativeToken not supported");
        fundingBalance[NativeTokenAddress] += msg.value;
        emit DepositToken(
            NativeTokenAddress,
            msg.sender,
            msg.value
        );
    }

    function depositErc20Token(address _tokenAddress, uint256 _tokenAmount) external {
        require(supportToken[_tokenAddress], "FunctionType:depositErc20Token not supported");

        IERC20(_tokenAddress).safeTransferFrom(msg.sender, address(this), _tokenAmount);

        fundingBalance[_tokenAddress] += _tokenAmount;

        emit DepositToken(
            _tokenAddress,
            msg.sender,
            _tokenAmount
        );
    }

    function withdrawNativeToken(address payable withdrawAddress, uint256 amount) external payable onlyManager {
        require(address(this).balance >= amount, "FunctionType:withdrawNativeToken balance is not enough");

        fundingBalance[NativeTokenAddress] -= amount;

        (bool success, ) = withdrawAddress.call{value: amount}("");
        if (!success) {
            revert();
        }

        emit WithdrawToken(
            NativeTokenAddress,
            msg.sender,
            withdrawAddress,
            amount
        );
    }

    function withdrawErc20Token(address withdrawAddress, address tokenAddress, uint256 amount) external onlyManager {
        require(
            fundingBalance[tokenAddress] >= amount,
            "FunctionType withdrawErc20Token: Insufficient token balance in contract"
        );

        fundingBalance[tokenAddress] -= amount;

        IERC20(tokenAddress).safeTransfer(withdrawAddress, amount);

        emit WithdrawToken(
            tokenAddress,
            msg.sender,
            withdrawAddress,
            amount
        );
    }

    function setSupportToken(address _tokenAddress, bool _isSupport) external  {
        supportToken[_tokenAddress] = _isSupport;
        emit SetSupportToken(_tokenAddress, _isSupport);
    }

    function setManagerAddress(address _managerAddress) external onlyOwner {
        address oldAddress = managerAddress;
        managerAddress = _managerAddress;
        emit SetManagerAddress(oldAddress, _managerAddress);
    }
}
