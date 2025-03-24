// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import {Test, console} from "forge-std/Test.sol";
import {GatekeeperOne} from "../src/GatekeeperOne.sol";
import {GatekeeperOneHacker} from "../src/GatekeeperOneHacker.sol";

contract GatekeeperOneHackerTest is Test {

  function test_hack() public {
    GatekeeperOne gatekeeper = new GatekeeperOne();
    GatekeeperOneHacker hacker = new GatekeeperOneHacker();
    hacker.hack(address(gatekeeper), 123);
    require(gatekeeper.entrant() == msg.sender, "GatekeeperOneHackerTest: hack failed");
  }
}