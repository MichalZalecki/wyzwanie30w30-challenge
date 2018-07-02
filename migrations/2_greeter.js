const Greeter = artifacts.require("./01_greeter/Greeter.sol");

module.exports = function(deployer) {
  deployer.deploy(Greeter, "Hello, World!");
};
