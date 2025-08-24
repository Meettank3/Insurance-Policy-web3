// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// creating struct for policies
struct Policy {
    string metadata;
    bool active;
}

// Example baseURI: "https://ipfs.io/ipfs/QmSGn7kmYExizUFTwUGdrTyAx4f6aT8PZcJ86m8CEVqXvZ/"
contract PolicyManagement {

    mapping(uint256 => Policy) public policies; // uint256 is policyId
    mapping(address => uint256[]) public holderPolicies; 
    string public baseURI;

    event PolicyCreated(uint256 indexed policyId, string metadataURI);

    constructor(string memory _baseURI) {
        baseURI = _baseURI; // Pass folder CID link ending with "/"
    }

    function createPolicy(
        uint256 _policyId,
        string memory _fileName
    ) public {        
        string memory fullURI = string(abi.encodePacked(baseURI, _fileName));

        policies[_policyId] = Policy({
            metadata: fullURI,
            active: true
        });

        emit PolicyCreated(_policyId, fullURI);
    }
}
