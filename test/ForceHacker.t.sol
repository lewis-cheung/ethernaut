// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ForceHacker} from "../src/ForceHacker.sol";
import {Force} from "../src/Force.sol";

contract ForceHackerTest is Test {

  function test_force() public {
    Force force = new Force();
    ForceHacker forceHacker = (new ForceHacker){value: 1 ether}(address(force));
    assertEq(address(force).balance, 1 ether);
  }
}