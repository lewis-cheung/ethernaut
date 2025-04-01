
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IDetectionBot {
  function handleTransaction(address user, bytes calldata msgData) external;
}

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;
    function notify(address user, bytes calldata msgData) external;
    function raiseAlert(address user) external;
}

contract DoubleEntryPointDetectionBot is IDetectionBot {
  address vaultAddress;

  constructor(address _vaultAddress) {
    vaultAddress = _vaultAddress;
  }

  function handleTransaction(address user, bytes calldata msgData) external {
    address origSender;
    assembly {
        origSender := calldataload(168)
    }
    if (origSender == vaultAddress) {
      IForta(msg.sender).raiseAlert(user);
    }
  }
}