// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import {Test, console} from "forge-std/Test.sol";
import {GatekeeperTwo} from "../src/GatekeeperTwo.sol";
import {GatekeeperTwoHacker} from "../src/GatekeeperTwoHacker.sol";

contract GatekeeperTwoHackerTest is Test {

  function test_hack() public {
    GatekeeperTwo gatekeeper = new GatekeeperTwo();
    address caller = vm.addr(1);
    vm.prank(caller, caller);
    new GatekeeperTwoHacker(address(gatekeeper));
    require(gatekeeper.entrant() == caller, "GatekeeperTwoHackerTest: hack failed");
  }
}