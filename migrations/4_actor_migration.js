const Actor = artifacts.require("Actor");

module.exports = function (deployer) {
    deployer.deploy(Actor);
};
