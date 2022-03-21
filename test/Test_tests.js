var assert = require('assert');

const MockedTest = artifacts.require('contracts/mocks/MockedTest.sol');

contract('MockedTest', (mockedTest) => {
    before(async () => {
        this.mockedTest = await MockedTest.deployed()
    })

    it('should return struct by token', async () => {
        let mockToken = "mock token";
        let result = await this.mockedTest.mock_getTestStructByToken(mockToken);

        assert.equal(result.name, "Mock name");
        assert.equal(result.token, mockToken);
        assert.equal(result.isBlocked, true);
    })

    it('should check if test struct exists', async () => {
        let result = await this.mockedTest.mock_testStructExists("mock token");
        expect(result).to.be.true
    })
})