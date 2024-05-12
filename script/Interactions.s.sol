// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {MONEYKUDIEGO} from "../src/Token.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {MONEYKUDIEGOScript} from "./Moneykudiego.s.sol";
import {Script, console} from "forge-std/Script.sol";

contract InteractrMKE is Script{

    address[] public addresses;
    uint256 amount = 10000 ether;
    address mostRecentlyDeployedContract = DevOpsTools.get_most_recent_deployment("MONEYKUDIEGO", block.chainid);
    function run() external {
        addAddresses(0x611419E8768E45d1e25A6B7d3A51403e9BEfC599);
        addAddresses(0xd0775dE88e29fF181452edBd3f7472b8487bC65F);
        addAddresses(0xa1C3E76b667C50D7f6fF1CF13a47846cF9A58b14);
        addAddresses(0xf393e4Ea3BE4beE1D7644a7ce1faCc5c12cCD877);
        addAddresses(0xd0775dE88e29fF181452edBd3f7472b8487bC65F);
        addAddresses(0x971c57eF6ABA9Beb07C5Df334DE91E4857063728);
        transferMKE();
    }

    function transferMKE() public {
        uint256 deployerPrivateKey =  vm.envUint("PRIVATE_KEY");
        address account = vm.addr(deployerPrivateKey);
        console.log("Deployer address: %s", account);
        vm.startBroadcast(deployerPrivateKey);
        MONEYKUDIEGO moneykudiego = MONEYKUDIEGO(mostRecentlyDeployedContract);
        for (uint i = 0; i < addresses.length; i++) {
            moneykudiego.transfer(addresses[i], amount);
            console.log("Token balance %s: %d", i, moneykudiego.balanceOf(addresses[i]));
        }
        console.log("Token balance of %s: %d", account, moneykudiego.balanceOf(account));
        vm.stopBroadcast();
    }

    function addAddresses(address _address) public {
        addresses.push(_address);
    }
}
