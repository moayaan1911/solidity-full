// SPDX-License-Identifier:MIT
import {UUPSUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";
pragma solidity 0.8.21;

contract BoxV2Contract is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 internal value;

    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
    }

    function _authorizeUpgrade(
        address newImplementationAddress
    ) internal override {}

    function setNumber(uint256 _value) external {
        value = _value;
    }

    function getNumber() external view returns (uint256) {
        return value;
    }

    function version() external pure returns (uint256) {
        return 2;
    }
}
