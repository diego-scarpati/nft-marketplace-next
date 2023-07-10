const { assert } = require("chai");

const KryptoBird = artifacts.require("./KryptoBird")

require("chai").use(require("chai-as-promised")).should()

contract("KryptoBird", accounts => {
  let contract

  describe("Deployment", async () => {
    // test sample => every test starts with an "it"
    it("Deploys successfuly", async () => {
      contract = await KryptoBird.deployed()
      const address = contract.address
      assert.notEqual(address, '')
      assert.notEqual(address, null)
      assert.notEqual(address, undefined)
      assert.notEqual(address, 0x0)
    })
  })
})