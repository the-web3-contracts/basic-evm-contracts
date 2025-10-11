const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");
const BigNumber = require("bignumber.js");


describe("TheWebThree", function () {
  async function deployTheWebThree() {
    const initialSupply = 10000000000

    // const initialSupply = new BigNumber(amount).times(new BigNumber(10).pow(10e18));

    const [owner, otherAccount] = await ethers.getSigners();
    console.log(owner.address)
    console.log(otherAccount.address)

    const TheWebThree = await ethers.getContractFactory("TheWebThree");
    const theWebThree = await TheWebThree.deploy();

    await theWebThree.initialize(initialSupply)

    await theWebThree.transfer(owner, initialSupply);

    return { theWebThree, owner, otherAccount, initialSupply};
  }


  describe("Deployment", function () {
    it("Should set the right symbol", async function () {
      const { theWebThree, owner, otherAccount,initialSupply  } = await loadFixture(deployTheWebThree);
      expect(await theWebThree.symbol()).to.equal("TWT");
      expect(await theWebThree.name()).to.equal("TheWebThree");
      console.log("decimals==", await theWebThree.decimals())
    });

    it("Should set the right owner", async function () {
      const { theWebThree, owner, otherAccount, initialSupply } = await loadFixture(deployTheWebThree);
      expect(await theWebThree.owner()).to.equal(owner.address);
    });

    it("Should receive right balance", async function () {
      const { theWebThree, owner, otherAccount,initialSupply  } = await loadFixture(deployTheWebThree);
      const balanceOf = await ethers.provider.getBalance(await theWebThree.owner())
      console.log(balanceOf)
      // expect(balanceOf).to.equal(initialSupply);
    });
  });
});
