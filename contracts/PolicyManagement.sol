// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.28;

// creating struct for policys
struct Policy{
    //uint256 policyId;
    string policyDetails;
    uint256 premiumAmount;   // fixed premium cost
    uint256 duration;        // in seconds or days
    bool active;
}

contract PolicyManagement{

    // giving variables to parties
    mapping(uint256 => Policy) public policies; //uint256 is policyId
    mapping(address => uint256[]) public holderPolicies; 

    function createPolicy(
        uint256 _policyId,
        string memory _policyDetails,
        uint256 _premiumAmount,
        bool _active,
        uint256 _duration
    ) public {        
        policies[_policyId] = Policy({
            policyDetails: _policyDetails,
            premiumAmount: _premiumAmount, // default value, can be set later
            active: _active,
            duration: _duration // default value, can be set later
        });
    }

    

}