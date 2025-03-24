// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ElevatorHacker} from "../src/ElevatorHacker.sol";
import {Elevator} from "../src/Elevator.sol";

contract ElevatorHackerTest is Test {

  function test_goTo() public {
    Elevator elevator = new Elevator();
    ElevatorHacker hacker = new ElevatorHacker();
    hacker.hack(address(elevator));
    assertEq(elevator.isTop(), true);
  }
}