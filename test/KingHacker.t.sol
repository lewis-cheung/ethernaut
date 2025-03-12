// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {KingHacker} from "../src/KingHacker.sol";
import {King} from "../src/King.sol";

contract KingHackerTest is Test {

  function test_king() public {
    vm.deal(vm.addr(1), 99 ether);
    vm.prank(vm.addr(1));
    King king = (new King){value: 0.1 ether}();
    KingHacker hacker = (new KingHacker){value: 1 ether}(address(king));
    assertEq(king._king(), address(hacker));
    vm.expectRevert();
    vm.prank(vm.addr(1));
    (bool success, ) = address(king).call{value: 2 ether}("");
  }
}