// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GoodSamaritan {
  Wallet public wallet;
  Coin public coin;

  constructor() {
    wallet = new Wallet();
    coin = new Coin(address(wallet));

    wallet.setCoin(coin);
  }

  function requestDonation() external returns (bool enoughBalance) {
    // donate 10 coins to requester
    try wallet.donate10(msg.sender) {
      return true;
    } catch (bytes memory err) {
      if (keccak256(abi.encodeWithSignature("NotEnoughBalance()")) == keccak256(err)) {
        // send the coins left
        wallet.transferRemainder(msg.sender);
        return false;
      }
    }
  }
}

contract Coin {
  mapping(address => uint256) public balances;

  error InsufficientBalance(uint256 current, uint256 required);

  constructor(address wallet_) {
      // one million coins for Good Samaritan initially
      balances[wallet_] = 10 ** 6;
  }

  function transfer(address dest_, uint256 amount_) external {
    uint256 currentBalance = balances[msg.sender];

    // transfer only occurs if balance is enough
    if (amount_ <= currentBalance) {
      balances[msg.sender] -= amount_;
      balances[dest_] += amount_;
      
      if (isContract(dest_)) {
        // notify contract
        INotifyable(dest_).notify(amount_);
      }
    } else {
      revert InsufficientBalance(currentBalance, amount_);
    }
  }

  function isContract(address _addr) public view returns (bool isContract){
    uint32 size;
    assembly {
      size := extcodesize(_addr)
    }
    return (size > 0);
  }

  function balanceOf(address addr_) external view returns (uint256) {
    return balances[addr_];
  }
}

contract Wallet {
  // The owner of the wallet instance
  address public owner;

  Coin public coin;

  error OnlyOwner();
  error NotEnoughBalance();

  modifier onlyOwner() {
    if (msg.sender != owner) {
      revert OnlyOwner();
    }
    _;
  }

  constructor() {
      owner = msg.sender;
  }

  function donate10(address dest_) external onlyOwner {
    // check balance left
    if (coin.balances(address(this)) < 10) {
      revert NotEnoughBalance();
    } else {
      // donate 10 coins
      coin.transfer(dest_, 10);
    }
  }

  function transferRemainder(address dest_) external onlyOwner {
    // transfer balance left
    coin.transfer(dest_, coin.balances(address(this)));
  }

  function setCoin(Coin coin_) external onlyOwner {
    coin = coin_;
  }
}

interface INotifyable {
  function notify(uint256 amount) external;
}