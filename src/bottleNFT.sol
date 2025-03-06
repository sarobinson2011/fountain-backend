// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BottleNFT is ERC721URIStorage, Ownable {
    uint256 private _nextTokenId;
    address public registryContract;

    event MintedNFT(uint256 _tokenId);

    constructor(string memory _name, string memory _symbol) Ownable(msg.sender) ERC721(_name, _symbol) {
        _nextTokenId = 1;
    }

    modifier onlyAuthorised() {
        require(msg.sender == registryContract || msg.sender == owner(), "Not authorised");
        _;
    }

    function setRegistry(address _registryContract) external onlyOwner {
        registryContract = _registryContract;
    }

    function mintNFT(address recipient, string memory tokenURI) external onlyAuthorised {
        uint256 _tokenId = _nextTokenId;
        _nextTokenId++;                         // increment _nextTokenId
        
        emit MintedNFT(_tokenId);

        _safeMint(recipient, _tokenId);
        _setTokenURI(_tokenId, tokenURI);
    }
}
