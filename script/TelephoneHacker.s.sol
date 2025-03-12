// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {TelephoneHacker} from "../src/TelephoneHacker.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        TelephoneHacker hacker = TelephoneHacker(0x2b33B8760Ac8ea8F3113B5b4b871Ad75Ca6EDF5C);
        hacker.relay(0x19992BE1266c4ba806eEE58B0910D0d9A1A2fE55);
        vm.stopBroadcast();
    }
}
