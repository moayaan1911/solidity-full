# FoundryNFT

**Description:**

The FoundryNFT chapter explores the creation of basic and dynamic NFTs with metadata hosted on IPFS. The `MoodNFT` contract, written in Solidity, is designed to mint NFTs reflecting the mood of the owner. This contract utilizes the ERC-721 standard for NFTs and integrates IPFS for metadata hosting.

**Contract Explanation:**
```solidity
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
```
- **Minting NFTs:**
  - The `mintNFT` function allows users to mint NFTs, incrementing the token counter and assigning a default mood of "Happy" to each newly minted NFT.

- **Mood Flipping:**
  - The `flipMood` function enables the owner of an NFT to toggle its mood between "Happy" and "Sad."

- **Metadata Generation:**
  - The `tokenURI` function generates metadata for each NFT, including mood-specific SVG image URIs and attributes. The metadata is compliant with the ERC-721 standard.

- **Base URI:**
  - The `_baseURI` function sets the base URI for the metadata, ensuring compliance with ERC-721 metadata standards.

**Glossary:**

- **ERC-721:**
  - **Explanation:** ERC-721 is a standard interface for non-fungible tokens (NFTs) on the Ethereum blockchain. It defines a set of rules and functions that NFTs must adhere to for seamless interaction with other contracts and applications.
  - **Resource Link:** [ERC-721 Standard Documentation](https://eips.ethereum.org/EIPS/eip-721)

- **IPFS:**
  - **Explanation:** InterPlanetary File System (IPFS) is a protocol and network designed to create a content-addressable, peer-to-peer method of storing and sharing hypermedia in a distributed file system.
  - **Resource Link:** [IPFS Documentation](https://docs.ipfs.io/)

- **Base64:**
  - **Explanation:** Base64 is a group of binary-to-text encoding schemes that represent binary data in an ASCII string format. In this context, it is used for encoding metadata within the contract.
  - **Resource Link:** [Base64 Documentation](https://en.wikipedia.org/wiki/Base64)

- **Solidity:**
  - **Explanation:** Solidity is a statically-typed programming language designed for developing smart contracts that run on the Ethereum Virtual Machine (EVM).
  - **Resource Link:** [Solidity Documentation](https://docs.soliditylang.org/)

- **OpenZeppelin Contracts:**
  - **Explanation:** OpenZeppelin Contracts is a library for secure smart contract development on Ethereum. It provides implementations of various standard contracts, including ERC-721 used in this contract.
  - **Resource Link:** [OpenZeppelin Contracts GitHub](https://github.com/OpenZeppelin/openzeppelin-contracts)

- **Foundry:**
  - **Explanation:** Foundry is a blazing-fast, portable, and modular toolkit for Ethereum application development written in Rust. It includes components like Forge (testing framework), Anvil (local Ethereum node), Cast (EVM interaction tool), and more.
  - **Resource Link:** [Foundry GitHub Repository](https://github.com/your_foundry_repository)

- **Forge:**
  - **Explanation:** Forge is a component of Foundry, serving as an Ethereum testing framework similar to Truffle. It facilitates the testing of smart contracts in a controlled environment.
  - **Resource Link:** [Forge Documentation](https://forge.getfoundry.sh/)

- **Anvil:**
  - **Explanation:** Anvil is a local Ethereum node in the Foundry toolkit, providing functionality similar to Ganache. It allows developers to run and test their smart contracts locally.
  - **Resource Link:** [Anvil Documentation](https://book.getfoundry.sh/anvil/)

- **Cast:**
  - **Explanation:** Cast is a tool in Foundry for EVM interaction, allowing developers to send transactions, query chain data, and perform other Ethereum-related tasks seamlessly.
  - **Resource Link:** [Cast Documentation](https://book.getfoundry.sh/cast/)

- **Makefile:**
  - **Explanation:** A Makefile is a configuration file used by the Make build automation tool. It contains a set of directives to define tasks and their dependencies, simplifying the build process.
  - **Resource Link:** [Makefile Tutorial](https://makefiletutorial.com/)

These technologies collectively contribute to the development, testing, and deployment of smart contracts in the Ethereum ecosystem.

**Usage:**

To deploy and interact with the `MoodNFT` contract, follow the instructions in the respective Foundry documentation. Ensure that the required dependencies, such as OpenZeppelin Contracts, are installed.

## Components:

- **Forge**: Ethereum testing (like Truffle).
- **Cast**: EVM interaction tool.
- **Anvil**: Local Ethereum node (like Ganache).
- **Chisel**: Swift, utilitarian Solidity REPL.


## Usage

```shell
$ forge build
$ forge test
$ forge fmt
$ forge snapshot
$ anvil
$ forge script script/Counter.s.sol:CounterScript --rpc-url <rpc_url> --private-key <private_key>
$ cast <subcommand>
$ forge --help; anvil --help; cast --help
```

For detailed instructions, refer to the [documentation](https://book.getfoundry.sh/).