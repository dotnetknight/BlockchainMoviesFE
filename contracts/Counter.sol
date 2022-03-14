// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Counter {
    uint256 public count;

    function increment() external {
        count += 1;
    }
}