// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Counter {
    uint256 public count;

    event LogCount(uint256 count);

    function increment() public {
        count += 1;

        emit LogCount(count);
    }

    function counts() public view returns (uint256) {
        return count;
    }

    function testString() public pure returns (string memory) {
        return "test string";
    }
}
