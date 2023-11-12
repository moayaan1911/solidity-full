// SPDX-License-Identifier:MIT
import {Test, console} from "../lib/forge-std/src/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
pragma solidity 0.8.21;

contract TestBasicNFT is Test {
    BasicNFT basicNFT;
    DeployBasicNft deployer;
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    address public USER = makeAddr("user");

    function setUp() external {
        deployer = new DeployBasicNft();
        basicNFT = deployer.run();
    }

    function testNFTName() external view {
        string memory expectedName = "Doggie";
        string memory actualName = basicNFT.name();

        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testMintNFTAndHaveBalance() external {
        vm.prank(USER);
        basicNFT.mintNFTs(PUG_URI);
        assert(basicNFT.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(basicNFT.tokenURI(0))) ==
                keccak256(abi.encodePacked(PUG_URI))
        );
    }
}
