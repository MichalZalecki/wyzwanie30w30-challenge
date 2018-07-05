const BalanceAndAddress = artifacts.require("./02_balance_and_address/BalanceAndAddress.sol");

module.exports = function(deployer) {
  deployer.deploy(BalanceAndAddress);
};
