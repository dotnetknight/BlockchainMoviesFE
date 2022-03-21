// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

import "../Test.sol";

contract MockedTest is Test {
    function mock_getTestStructByToken(string memory token)
        public
        view
        returns (TestStruct memory)
    {
        TestStruct memory testStruct = mapTestStruct[token];
        testStruct.token = token;
        testStruct.name = "Mock name";
        testStruct.isBlocked = true;

        return testStruct;
    }

    function mock_testStructExists(string memory token)
        public
        view
        returns (bool)
    {
        TestStruct memory testStruct = mock_getTestStructByToken(token);

        return
            keccak256(abi.encodePacked(testStruct.token)) ==
            keccak256(abi.encodePacked(token));
    }
}
