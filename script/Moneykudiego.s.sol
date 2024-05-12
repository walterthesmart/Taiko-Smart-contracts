// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {MONEYKUDIEGO} from "../src/Token.sol";

contract MONEYKUDIEGOScript is Script {
    function setup() public {}

    function run() public {
        uint256 deployerPrivateKey =  vm.envUint("PRIVATE_KEY");
        address account = vm.addr(deployerPrivateKey);
        console.log("Deployer address: %s", account);
        vm.startBroadcast(deployerPrivateKey);
        // Deploy Token contract
        MONEYKUDIEGO token = new MONEYKUDIEGO();
        console.log("Contract deployed at %s", address(token));
        console.log("Token balance: %d", token.balanceOf(address(this)));

        vm.stopBroadcast();
    }
}