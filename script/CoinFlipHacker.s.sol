// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {CoinFlipHacker} from "../src/CoinFlipHacker.sol";

contract CounterScript is Script {
    CoinFlipHacker public counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        CoinFlipHacker coinFlipHacker = CoinFlipHacker(address(0x7aD014D470cF59aecE4c03D675FD71fdd520355b));
        coinFlipHacker.guess();
        vm.stopBroadcast();
    }
}
