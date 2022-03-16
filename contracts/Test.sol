// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract TestContract {
    struct TestStruct {
        string token;
        string name;
        TestStructArgument Argument;
        bool isBlocked;
    }

    struct TestStructArgument {
        string token;
        string[] arrayElements;
        string field1;
        string field2;
        string field3;
        Array array;
    }

    struct Array {
        string token;
        string comment;
    }

    //["0xA27eEfe6b5180F085CE6Aa5D6DaA81d1c35153C0", "Test", ["0xA27eEfe6b5180F085CE6Aa5D6DaA81d1c35153C0",["Array element 1", "array element 2"], "Field1","Field2","Field3",["0xA27eEfe6b5180F085CE6Aa5D6DaA81d1c35153C0", "Comment"]], true]
    TestStruct[] testStructs;
    mapping(string => TestStruct) internal mapTestStruct;

    function addTestStruct(TestStruct memory testStructToAdd) public {
        TestStruct storage testStruct = mapTestStruct[testStructToAdd.token];

        testStruct.token = testStructToAdd.token;
        testStruct.name = testStructToAdd.name;
        testStruct.isBlocked = testStructToAdd.isBlocked;
        testStruct.Argument = testStructToAdd.Argument;
        for (
            uint256 i = 0;
            i < testStructToAdd.Argument.arrayElements.length;
            i++
        ) {
            testStruct.Argument.arrayElements.push(
                testStructToAdd.Argument.arrayElements[i]
            );
        }

        testStructs.push(testStruct);
    }

    function getTestStructs() public view returns (TestStruct[] memory) {
        return testStructs;
    }

    function getTestStructLength() public view returns (uint256) {
        return testStructs.length;
    }
}
