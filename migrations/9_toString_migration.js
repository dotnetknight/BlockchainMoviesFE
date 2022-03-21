const ToStringContract = artifacts.require("ToStringContract");

module.exports = function (deployer) {
    deployer.deploy(ToStringContract);
};
