// SPDX-License-Identifier:MIT

pragma solidity 0.8.21;

import {Script, console} from "forge-std/Script.sol";
import {BoxV1Contract} from "../src/BoxV1.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployBox is Script {
    function run() external returns (address) {
        address proxy = deployBox();
        return proxy;
    }

    function deployBox() public returns (address) {
        vm.startBroadcast();
        BoxV1Contract box = new BoxV1Contract();
        ERC1967Proxy proxy = new ERC1967Proxy(address(box), "");
        vm.stopBroadcast();
        return address(proxy);
    }
}
