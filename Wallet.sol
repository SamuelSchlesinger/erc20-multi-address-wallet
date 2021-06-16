// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "IERC20.sol";

// Multi-address wallet
contract Wallet {
  address[] _addresses;

  constructor(address[] memory addresses_) {
    _addresses = addresses_;
  }

  function pay(address _token, address _to, uint256 _quantity) public {
    bool check = false;
    for(uint i = 0; i < _addresses.length; i = i + 1) {
      check = check || msg.sender == _addresses[i];
    }
    require(check, "Sender is not one of the known addresses");
    require(IERC20(_token).transfer(_to, _quantity), "Could not transfer tokens to address");
  }
}
