// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import {Test, console} from "forge-std/Test.sol";
import {GoodSamaritan, Wallet, Coin} from "../src/GoodSamaritan.sol";
import {GoodSamaritanHacker} from "../src/GoodSamaritanHacker.sol";

contract GoodSamaritanTest is Test {

  function test_hack() public {
    address deployer = vm.addr(1);
    address hacker = vm.addr(2);
    
    vm.startPrank(deployer, deployer);
    GoodSamaritan target = new GoodSamaritan();
    Wallet wallet = target.wallet();
    Coin coin = target.coin();
    assertEq(coin.balanceOf(address(wallet)), 10 ** 6);

    vm.startPrank(hacker, hacker);
    GoodSamaritanHacker hackerContract = new GoodSamaritanHacker();
    hackerContract.hack(address(target));
    assertEq(coin.balanceOf(address(hackerContract)), 10 ** 6);
    assertEq(coin.balanceOf(address(wallet)), 0);
  }
}