// SPDX-License-Identifier:MIT

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";

pragma solidity 0.8.21;

contract MoodNFT is ERC721 {
    error MOODNFT__NotTheOwner();

    uint256 private tokenCounter;
    string private sadSvgImageUri;
    string private happySvgImageUri;

    enum Mood {
        Happy,
        Sad
    }

    mapping(uint256 => Mood) private tokenIdToMood;

    constructor(
        string memory _sadSvgImageUri,
        string memory _happySvgImageUri
    ) ERC721("Mood NFT", "MN") {
        sadSvgImageUri = _sadSvgImageUri;
        happySvgImageUri = _happySvgImageUri;
        tokenCounter = 0;
    }

    function mintNFT() external {
        _safeMint(msg.sender, tokenCounter);
        tokenIdToMood[tokenCounter] = Mood.Happy;
        tokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(
        uint256 _tokenId
    ) public view override returns (string memory) {
        string memory imageURI;
        if (tokenIdToMood[_tokenId] == Mood.Happy) {
            imageURI = happySvgImageUri;
        } else {
            imageURI = sadSvgImageUri;
        }

        return
            string(
                abi.encodePacked(
                    _baseURI(),
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name":"',
                                name(),
                                '", "description":"An NFT that reflects the mood of the owner, 100% on Chain!", ',
                                '"attributes": [{"trait_type": "moodiness", "value": 100}], "image":"',
                                imageURI,
                                '"}'
                            )
                        )
                    )
                )
            );
    }

    function flipMood(uint _tokenId) public {
        address owner = _ownerOf(_tokenId);
        if (owner != msg.sender) {
            revert MOODNFT__NotTheOwner();
        }
        if (tokenIdToMood[_tokenId] == Mood.Happy) {
            tokenIdToMood[_tokenId] = Mood.Sad;
        } else {
            tokenIdToMood[_tokenId] = Mood.Happy;
        }
    }
}
