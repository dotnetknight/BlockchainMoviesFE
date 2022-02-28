const Movies = artifacts.require("Movies");

module.exports = function (deployer) {
    deployer.deploy(Movies);
};
