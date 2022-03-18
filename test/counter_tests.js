const Counter = artifacts.require('contracts/Counter.sol');

contract('Counter', (counter) => {
    before(async () => {
        this.counter = await Counter.deployed()
    })

    it('should increment a count', async () => {
        await this.counter.increment();
        const counts = await this.counter.counts();
        const count = await this.counter.count();

        expect(counts.toNumber()).to.equal(count.toNumber());
    })

    it('should check if strings are equal', async () => {
        const returnedString = await this.counter.testString();

        assert.equal(returnedString, "test string");
    })
})