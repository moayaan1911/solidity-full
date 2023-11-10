// SPDX-License-Identifier:MIT
pragma solidity 0.8.21;

import {Script} from "forge-std/Script.sol";
import {Raffle} from "../src/Raffle.sol";

contract DeployRaffle is Script {
    constructor() {}

    function run() external returns (Raffle) {
        vm.startBroadcast();
        Raffle raffle = new Raffle({
            _entranceFee: 0.01 ether,
            _interval: 30,
            _coordinator: 0x8103B0A8A00be2DDC778e6e7eaa21791Cd364625,
            _keyHash: 0x474e34a077df58807dbe9c96d3c009b23b3c6d0cce433e59bbf5b34f823bc56c,
            _subscriptionID: 6815,
            _callbackGasLimit: 500000
        });

        vm.stopBroadcast();
        return raffle;
    }
}
