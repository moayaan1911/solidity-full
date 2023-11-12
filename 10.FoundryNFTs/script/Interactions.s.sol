// SPDX-License-Identifier:MIT
import {DeployBasicNft} from "./DeployBasicNft.s.sol";
import {Script} from "../lib/forge-std/src/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
pragma solidity 0.8.21;

contract MintBasicNFT is Script {
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address mostRecentDeployedAddress = DevOpsTools
            .get_most_recent_deployment("BasicNFT", block.chainid);
        mintNFTonContract(mostRecentDeployedAddress);
    }

    function mintNFTonContract(address _mostRecentDeployedAddress) public {
        vm.startBroadcast();
        BasicNFT(_mostRecentDeployedAddress).mintNFTs(PUG_URI);
        vm.stopBroadcast();
    }
}
