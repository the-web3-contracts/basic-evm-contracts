// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Vm.sol";
import {Script, console} from "forge-std/Script.sol";
import "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

import { EmptyContract } from "./utils/EmptyContract.sol";
import { FundingManage } from "../src/contracts/FundingManage.sol";


contract FundingManageScript is Script {
    EmptyContract public emptyContract;
    ProxyAdmin public  fundingManagerProxyAdmin;

    FundingManage public fundingManager;
    FundingManage public fundingManagerImplementation;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        address deployerAddress = vm.addr(deployerPrivateKey);
        vm.startBroadcast(deployerPrivateKey);

        emptyContract = new EmptyContract();

        TransparentUpgradeableProxy proxyFundingManager = new TransparentUpgradeableProxy(address(emptyContract), deployerAddress, "");
        fundingManager = FundingManage(payable(address(proxyFundingManager)));

        fundingManagerImplementation = new FundingManage();
        fundingManagerProxyAdmin = ProxyAdmin(getProxyAdminAddress(address(proxyFundingManager)));

        fundingManagerProxyAdmin.upgradeAndCall(
            ITransparentUpgradeableProxy(address(fundingManager)),
            address(fundingManagerImplementation),
            abi.encodeWithSelector(
                FundingManage.initialize.selector,
                deployerAddress,
                deployerAddress
            )
        );

        console.log("deploy fundingManagerImplementation:", address(fundingManagerImplementation));
        console.log("deploy fundingManager:", address(fundingManager));

        vm.stopBroadcast();
    }

    function getProxyAdminAddress(address proxy) internal view returns (address) {
        address CHEATCODE_ADDRESS = 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D;
        Vm vm = Vm(CHEATCODE_ADDRESS);

        bytes32 adminSlot = vm.load(proxy, ERC1967Utils.ADMIN_SLOT);
        return address(uint160(uint256(adminSlot)));
    }
}

/*
== Logs ==
  deploy fundingManagerImplementation: 0x747F6884855bef07F5912DC4d1822cA57acBd850
  deploy fundingManager: 0x0DBF99F7B59868C1859aC24257A0A0cF38d873A7
*/
