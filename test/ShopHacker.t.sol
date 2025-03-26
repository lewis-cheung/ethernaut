// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {ShopHacker} from "../src/ShopHacker.sol";
import {Shop} from "../src/Shop.sol";

contract ShopHackerTest is Test {

  function test_hack() public {
    Shop shop = new Shop();
    ShopHacker hacker = new ShopHacker();
    hacker.hack(address(shop));
    assertLt(shop.price(), 100);
  }
}
