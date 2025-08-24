// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// creating struct for policies
struct Policy {
    //uint256 id;
    address holder;
    uint256 premiumAmount; // per-period or total (decide one)
    uint256 startDate;
    uint256 endDate;
    bool active;  
}

// Example baseURI: "https://ipfs.io/ipfs/QmSGn7kmYExizUFTwUGdrTyAx4f6aT8PZcJ86m8CEVqXvZ/"
contract PolicyManagement {

    // creating variables 
    uint256 public nextPolicyId;
    
    mapping(uint256 => Policy[]) public policiesId;
    mapping(address => mapping(uint256 => Policy)) public holderPolicies;

    modifier onlyPolicyHolder(address _holder, uint256 _policyId) {
        require(holderPolicies[_holder][_policyId].holder == msg.sender, "Only Policy Holder can call this function");
        _;
    }

    function _exists(uint256 policyId) internal view returns (bool) { 
        
    }

}
