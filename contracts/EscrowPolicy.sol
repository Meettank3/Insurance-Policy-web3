// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EscrowPolicy {
    address public seller;
    address public policyAddress;  // which will be minted from another contract 
    address public inspector;

    constructor(address _seller, address _policyAddress, address _inspector){
        seller = _seller;
        policyAddress =_policyAddress;
        inspector = _inspector;
    }

    modifier onlySeller() {
        require(msg.sender == seller, "Only seller can access this function");
        _;
    }

    modifier onlyInspector(){
        require(msg.sender == inspector, "Only Inspector is allowed");
        _;
    }


}