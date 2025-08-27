const { expect } = require('chai');
const { ethers } = require('hardhat');

// this convert value/Currency into Eths
const tokens = (n) => {
    return ethers.utils.parseUnits(n.toString(), 'ether')
}

describe('PolicyManagement', () => {
    // Descirbe the variables for testing
    let policyManagement, deployer, transaction;

    beforeEach(async () => {
        const PolicyManagement = await ethers.getContractFactory('PolicyManagement');
        policyManagement = await PolicyManagement.deploy("https://ipfs.io/ipfs/QmSGn7kmYExizUFTwUGdrTyAx4f6aT8PZcJ86m8CEVqXvZ/");
        await policyManagement.waitForDeployment();
        //console.log("contract Deployed", policyManagement);
    });

    it("Deployment",async () => {
        const contractAddress = await policyManagement.getAddress();  // ✅ ethers v6
        expect(contractAddress).to.properAddress;
        console.log('PolicyManagement deployed to:', contractAddress);
    });

    // this should mint policies which are included in my ipfs folder only

    /*
    i want to check that it should not mint more policys which are not in my ipfs folde for ex in my folder i have 5 policy it should not mine more than 5 policy's
    */
    it("Minting ", async () => {

        for (let i = 1; i <=5 ; i++) {            
            const metadataURI = `https://ipfs.io/ipfs/QmSGn7kmYExizUFTwUGdrTyAx4f6aT8PZcJ86m8CEVqXvZ/policy${i}.json`;            
            const tx = await policyManagement.mint(metadataURI);
            await tx.wait();
            //const tokenURI = await policyManagement.tokenURI(i);
            console.log(`Minted Policy ${i}:`,metadataURI);
        }        
        console.log("totalSupply fun: ",await policyManagement.totalSupply());
    });
    
})