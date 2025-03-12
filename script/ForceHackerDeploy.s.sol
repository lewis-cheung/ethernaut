// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {ForceHacker} from "../src/ForceHacker.sol";

contract ForceHackerDeploy is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        (new ForceHacker){value: 1}(0x49de1faEfc009928A8527Af75b5dBf6dc2Cf013E);
        vm.stopBroadcast();
    }
}