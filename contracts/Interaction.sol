// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface ICounter {
    function count() external view returns (uint256);

    function increment() external;
}

contract Interaction {
    address counterAddr;

    function setCounterAddr(address _counter) public payable {
        counterAddr = _counter;
    }

    function getCount() external view returns (uint256) {
        return ICounter(counterAddr).count();
    }
}
