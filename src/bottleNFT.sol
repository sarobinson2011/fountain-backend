// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleNFT is ERC721URIStorage, Ownable {
    uint256 private _nextTokenId;

    constructor() ERC721("SimpleNFT", "SNFT") {}

    function mintNFT(address recipient, string memory tokenURI) public onlyOwner {
        uint256 tokenId = _nextTokenId;
        _nextTokenId++;
        
        _safeMint(recipient, tokenId);
        _setTokenURI(tokenId, tokenURI);
    }
}
