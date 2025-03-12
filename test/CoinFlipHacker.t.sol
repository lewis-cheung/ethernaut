// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CoinFlipHacker} from "../src/CoinFlipHacker.sol";
import {CoinFlip} from "../src/CoinFlip.sol";

contract CoinFlipHackerTest is Test {
    CoinFlipHacker public coinFlipHacker;

    function setUp() public {
        CoinFlip coinFlip = new CoinFlip();
        coinFlipHacker = new CoinFlipHacker(address(coinFlip));
    }

    function test_guess() public {
        bool result;
        vm.roll(1); 
        result = coinFlipHacker.guess();
        assertEq(result, true);
        vm.roll(2);
        result = coinFlipHacker.guess();
        assertEq(result, true);
        vm.roll(3);
        result = coinFlipHacker.guess();
        assertEq(result, true);
        vm.roll(4);
        result = coinFlipHacker.guess();
        assertEq(result, true);
        vm.roll(5);
        result = coinFlipHacker.guess();
        assertEq(result, true);
        vm.roll(6);
        result = coinFlipHacker.guess();
        assertEq(result, true);
        vm.roll(7);
        result = coinFlipHacker.guess();
        assertEq(result, true);
        vm.roll(8);
        result = coinFlipHacker.guess();
        assertEq(result, true);
        vm.roll(9);
        result = coinFlipHacker.guess();
        assertEq(result, true);
    }
}
