// SPDX-License-Identifier:MIT
import {MoodNFT} from "../src/MoodNft.sol";
import {Script, console} from "../lib/forge-std/src/Script.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";
pragma solidity 0.8.21;

contract DeployMoodNFT is Script {
    function run() external returns (MoodNFT) {
        string memory sadSvg = vm.readFile("./img/sad.svg");
        string memory happySvg = vm.readFile("./img/happy.svg");
        vm.startBroadcast();
        MoodNFT moodNFT = new MoodNFT(
            svgToImageUri(sadSvg),
            svgToImageUri(happySvg)
        );
        vm.stopBroadcast();
        return moodNFT;
        // return moodNFT;
    }

    function svgToImageUri(
        string memory _imageUri
    ) public pure returns (string memory) {
        string memory baseUri = "data:image/svg+xml;base64,";
        string memory imageUri = Base64.encode(
            bytes(string(abi.encodePacked(_imageUri)))
        );

        return string(abi.encodePacked(baseUri, imageUri));
    }
}
