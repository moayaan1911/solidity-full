// SPDX-License-Identifier:MIT

pragma solidity 0.8.21;

import {Script} from "forge-std/Script.sol";
import {BoxV2Contract} from "../src/BoxV2.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {BoxV1Contract} from "../src/BoxV1.sol";

contract UpgradeBox is Script {
    function run() external returns (address) {
        address mostRecentlyDeployedProxy = DevOpsTools
            .get_most_recent_deployment("ERC1967Proxy", block.chainid);

        vm.startBroadcast();
        BoxV2Contract newBox = new BoxV2Contract();
        vm.stopBroadcast();
        address proxy = upgradeBox(mostRecentlyDeployedProxy, address(newBox));
        return proxy;
    }

    function upgradeBox(
        address proxyAddress,
        address newBox
    ) public returns (address) {
        vm.startBroadcast();
        BoxV1Contract proxy = BoxV1Contract(payable(proxyAddress));
        proxy.upgradeTo(address(newBox));
        vm.stopBroadcast();
        return address(proxy);
    }
}
