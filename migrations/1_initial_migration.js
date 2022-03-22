const Migrations = artifacts.require("Migrations");
const Movies = artifacts.require("Movies");
const Tickets = artifacts.require("Tickets");
const Actor = artifacts.require("Actor");
const Counter = artifacts.require("Counter");
const Interaction = artifacts.require("Interaction");
const TestContract = artifacts.require("Test");
const MockedTest = artifacts.require("MockedTest");
const ToStringContract = artifacts.require("ToStringContract");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Movies);
  deployer.deploy(Tickets);
  deployer.deploy(Actor);
  deployer.deploy(Counter);
  deployer.deploy(Interaction);
  deployer.deploy(TestContract);
  deployer.deploy(MockedTest);
  deployer.deploy(ToStringContract);
};
