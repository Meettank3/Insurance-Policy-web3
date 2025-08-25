const { expect } = require('chai');
const { ethers } = require('hardhat');

// this convert value/Currency into Eths
const tokens = (n) => {
    return ethers.utils.parseUnits(n.toString(), 'ether')
}

describe('PolicyManagement', () => {
    // Descirbe the variables for testing
    let policyManagement, deployer;

    beforeEach(async () => {
        const PolicyManagement = await ethers.getContractFactory('PolicyManagement');
        policyManagement = await PolicyManagement.deploy();
        await policyManagement.waitForDeployment();
    });

    it("Deployment",async () => {
        const contractAddress = await policyManagement.getAddress();  // ✅ ethers v6
        expect(contractAddress).to.properAddress;
        console.log('PolicyManagement deployed to:', contractAddress);
    });
    
})