// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract FunctionType {
    using SafeERC20 for IERC20;

    address public constant NativeTokenAddress = address(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);

    mapping(address => uint256) public fundingBalance;
    mapping(address => bool) public supportToken;

    event SetSupportToken(
        address indexed tokenAddress,
        bool isSupport
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

    receive() external payable {
        depositNativeToken();
    }

    function depositNativeToken() public payable {
        require(supportToken[NativeTokenAddress], "FunctionType:depositNativeToken not supported");
        fundingBalance[NativeTokenAddress] += msg.value;
        emit DepositToken(
            NativeTokenAddress,
            msg.sender,
            msg.value
        );
    }

    function depositErc20Token(address _tokenAddress, uint256 _tokenAmount) public {
        require(supportToken[_tokenAddress], "FunctionType:depositErc20Token not supported");

        IERC20(_tokenAddress).safeTransferFrom(msg.sender, address(this), _tokenAmount);

        fundingBalance[_tokenAddress] += _tokenAmount;

        emit DepositToken(
            _tokenAddress,
            msg.sender,
            _tokenAmount
        );
    }

    function withdrawNativeToken(address payable withdrawAddress, uint256 amount) public payable {
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

    function withdrawErc20Token(address withdrawAddress, address tokenAddress, uint256 amount) public {
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

    function setSupportToken(address _tokenAddress, bool _isSupport) internal  {
        supportToken[_tokenAddress] = _isSupport;
        emit SetSupportToken(_tokenAddress, _isSupport);
    }

    function setToken() public virtual {
        setSupportToken(NativeTokenAddress, true);
    }

}

// public: 任何地方都可以调用
// external: 合约内部和继承类合约不可以调用，只能外部可以调用
// private: 只能内部合约调用，继承和其他合约都不能调用
// internal: 在当前和派生合约里面都可以调用，外部合约不行
contract testModitify is FunctionType {
    function setToken() public override {
        setSupportToken(NativeTokenAddress, true);
    }

    function setToken(address nativeTokenAddress) public {
        setSupportToken(nativeTokenAddress, true);
    }
}

contract testModitifyTwo {
    address public constant NativeTokenAddress = address(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);

//    function testMf() public {
//        FunctionType ft = new FunctionType();
//        ft.setSupportToken(NativeTokenAddress, true);
//    }
}

