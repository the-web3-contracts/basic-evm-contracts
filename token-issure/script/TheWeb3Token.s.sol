// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Vm.sol";
import {Script, console } from "forge-std/Script.sol";
import "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

import "../src/TheWeb3Token.sol";
import "../test/EmptyContract.sol";


contract TheWeb3TokenScript is Script {
    EmptyContract public emptyContract;
    TheWeb3Token public theWeb3Token;
    TheWeb3Token public theWeb3TokenImplementation;
    ProxyAdmin public theWeb3TokenProxyAdmin;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);

        vm.startBroadcast(deployerPrivateKey);

        emptyContract = new EmptyContract();

        TransparentUpgradeableProxy proxyTheWeb3Token = new TransparentUpgradeableProxy(address(emptyContract), deployerAddress, "");

        theWeb3Token = TheWeb3Token(payable(address(proxyTheWeb3Token)));

        console.log("TheWeb3Token address======", address(theWeb3Token));

        theWeb3TokenImplementation = new TheWeb3Token();
        theWeb3TokenProxyAdmin = ProxyAdmin(getProxyAdminAddress(address(proxyTheWeb3Token)));

        theWeb3TokenProxyAdmin.upgradeAndCall(
            ITransparentUpgradeableProxy(address(theWeb3Token)),
            address(theWeb3TokenImplementation),
            abi.encodeWithSelector(
                TheWeb3Token.initialize.selector,
                10e40,
                msg.sender
            )
        );
        vm.stopBroadcast();
    }

    function getProxyAdminAddress(address proxy) internal view returns (address) {
        address CHEATCODE_ADDRESS = 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D;
        Vm vm = Vm(CHEATCODE_ADDRESS);

        bytes32 adminSlot = vm.load(proxy, ERC1967Utils.ADMIN_SLOT);
        return address(uint160(uint256(adminSlot)));
    }
}
