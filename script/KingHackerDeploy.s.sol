// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {KingHacker} from "../src/KingHacker.sol";

contract KingHackerDeploy is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        (new KingHacker){value: 0.0011 ether}(0x00681241093e09dA391F3E25D658719eF91bD73F);
        vm.stopBroadcast();
    }
}