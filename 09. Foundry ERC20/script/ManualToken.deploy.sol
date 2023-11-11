// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.21;

import {Script} from "../lib/forge-std/src/Script.sol";
import {ManualERC20Token} from "../src/ManualToken.sol";

contract ManualTokenDeploy is Script {
    function run() external returns (ManualERC20Token) {
        vm.startBroadcast();
        ManualERC20Token manualERC20Token = new ManualERC20Token();
        vm.stopBroadcast();
        return manualERC20Token;
    }
}
