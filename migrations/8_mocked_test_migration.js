const MockedTest = artifacts.require("MockedTest");

module.exports = function (deployer) {
    deployer.deploy(MockedTest);
};
