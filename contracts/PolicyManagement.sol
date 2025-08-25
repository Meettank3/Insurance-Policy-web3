// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//importing OpenZeppelin contracts
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// creating struct for policiess

// Example baseURI: "https://ipfs.io/ipfs/QmSGn7kmYExizUFTwUGdrTyAx4f6aT8PZcJ86m8CEVqXvZ/"
contract PolicyManagement is ERC721URIStorage{

    using Counters for Counters.Counter; // Correctly using Counters library
    Counters.Counter private _tokenIds;

    constructor() ERC721("Policy Management","Policy"){}

    function mint(string memory _tokenURI) public returns (uint256){        
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, _tokenURI);
        return newItemId;
    }

    function totalSupply() public view returns (uint256){
        return _tokenIds.current();
    }

}
