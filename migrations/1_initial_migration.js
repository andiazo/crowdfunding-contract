const CrowdFunding = artifacts.require("1_CrowdFunding");

module.exports = function (deployer) {
  deployer.deploy(CrowdFunding);
};
