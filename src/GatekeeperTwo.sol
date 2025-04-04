// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {console} from "forge-std/Test.sol";

contract GatekeeperTwo {
  address public entrant;

  modifier gateOne() {
    console.log("msg.sender: %s", msg.sender);
    console.log("tx.origin: %s", tx.origin);
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    uint256 x;
    assembly {
      x := extcodesize(caller())
    }
    console.log("x: %d", x);
    require(x == 0, "x != 0");
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
    console.log("msg.sender: %s", msg.sender);
    require(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == type(uint64).max, "GatekeeperTwo: gateThree failed");
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}