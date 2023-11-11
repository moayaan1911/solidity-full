// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.21;

import {Script} from "../lib/forge-std/src/Script.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenDeploy is Script {
    function run() external returns (OurToken) {
        vm.startBroadcast();
        OurToken ourToken = new OurToken(1000 ether);
        vm.stopBroadcast();
        return ourToken;
    }
}
