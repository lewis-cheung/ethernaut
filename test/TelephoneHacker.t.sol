// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {TelephoneHacker} from "../src/TelephoneHacker.sol";
import {Telephone} from "../src/Telephone.sol";

contract TelephoneTest is Test {
  TelephoneHacker public telephoneHacker;
  Telephone public telephone;

  function setUp() public {
      telephone = new Telephone();
      telephoneHacker = new TelephoneHacker(address(telephone));
  }

  function test_relay() public {
    address newOwner = address(0x1234567890123456789012345678901234567890);
    telephoneHacker.relay(newOwner);
    assertEq(telephone.getOwner(), newOwner);
  }
}
