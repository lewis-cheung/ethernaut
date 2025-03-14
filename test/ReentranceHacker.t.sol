// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ReentranceHacker} from "../src/ReentranceHacker.sol";
import {Reentrance} from "../src/Reentrance.sol";

contract ReentranceHackerTest is Test {

  // This doesn't work because solidity 0.8.0 up prevents int underflow
  // function test_hack() public {
  //   Reentrance reentrance = new Reentrance();
  //   vm.deal(vm.addr(1), 1 ether);
  //   vm.prank(vm.addr(1));
  //   payable(address(reentrance)).transfer(0.09 ether);

  //   ReentranceHacker hacker = new ReentranceHacker(address(reentrance));
  //   hacker.hack{value: 0.03 ether}();
  //   assertEq(address(reentrance).balance, 0);
  // }
}
