// SPDX-License-Identifier:MIT

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

pragma solidity 0.8.21;

contract BasicNFT is ERC721 {
    uint256 private tokenCounter;
    mapping(uint256 => string) tokenIdToURI;

    constructor() ERC721("Doggie", "DOG") {
        tokenCounter = 0;
    }

    function mintNFTs(string memory _tokenURI) external {
        tokenIdToURI[tokenCounter] = _tokenURI;
        _safeMint(msg.sender, tokenCounter);
        tokenCounter++;
    }

    function tokenURI(
        uint256 _tokenId
    ) public view override returns (string memory) {
        return tokenIdToURI[_tokenId];
    }
}
