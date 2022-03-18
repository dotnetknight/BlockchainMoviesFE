var assert = require('assert');
// const { it } = require('mocha');

const Test = artifacts.require('contracts/Test.sol');

contract('Test', (test) => {
    before(async () => {
        this.test = await Test.deployed()
    })

    it('should return length of test structs', async () => {
        const lengthOfStruct = await this.test.getTestStructLength();

        assert.equal(lengthOfStruct.toNumber(), 0);
    })
})