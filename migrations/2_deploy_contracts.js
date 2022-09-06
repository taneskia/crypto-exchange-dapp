var CryptoExchange = artifacts.require("./CryptoExchange.sol");

module.exports = function(deployer) {
  deployer.deploy(CryptoExchange);
};
