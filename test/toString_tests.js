var assert = require('assert');

const ToStringContract = artifacts.require('contracts/ToStringContract.sol');

contract('ToStringContract', (toStringContract) => {
    before(async () => {
        toStringContract = await ToStringContract.deployed()
    })

    it('should convert uint to string', async () => {
        const number = 123;
        const stringNumber = "123";
        let result = await toStringContract.uint2str(number);

        expect(result).to.equal(stringNumber)
    })
})