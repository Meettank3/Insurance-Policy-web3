
// created boilerPlate for deployment script
const tokens = (n) => {
    return ethers.utils.parseUnits(n.toString(), 'ether');
}

const her = require('hardhat');

async function main() {

}

main().catch((error)=>{
    console.log(error);
    process.exitCode = 1;
});