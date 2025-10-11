const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");


module.exports = buildModule("TheWebThree", (m) => {
  const InitialSupply = 1_000_000_000;
  const theWeb3Contract = m.contract("TheWebThree");

  m.call(theWeb3Contract, "initialize", [InitialSupply], { after: [theWeb3Contract] });

  return { theWeb3Contract };
});
