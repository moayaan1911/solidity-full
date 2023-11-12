// SPDX-License-Identifier:MIT
import {BasicNFT} from "../src/BasicNFT.sol";
import {Script} from "../lib/forge-std/src/Script.sol";
pragma solidity 0.8.21;

contract DeployBasicNft is Script {
    function run() external returns (BasicNFT) {
        vm.startBroadcast();
        BasicNFT basicNFT = new BasicNFT();
        vm.stopBroadcast();
        return basicNFT;
    }
}
