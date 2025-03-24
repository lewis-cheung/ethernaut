// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {ElevatorHacker} from "../src/ElevatorHacker.sol";

contract ElevatorHackerDeploy is Script {
  function setUp() public {}

  function run() public {
    vm.startBroadcast();
    ElevatorHacker hacker = new ElevatorHacker();
    hacker.hack(0x2c4D7819044bb85cD5AFC51562fd5EB1ebF78a2e);
    vm.stopBroadcast();
  }
}