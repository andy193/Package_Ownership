const PackageOwnership = artifacts.require("PackageOwnership");

module.exports = function(deployer) {
  deployer.deploy(PackageOwnership);
};
