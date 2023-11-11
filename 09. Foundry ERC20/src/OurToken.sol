// SPDX-License-Identifier:MIT
import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
pragma solidity 0.8.21;

/**
 * @title Openzeppelin Smart Contract ERC20
 * @author moayaan.eth
 * @notice Learning OpenZeppelin contracts for ERC20 standards
 * @dev Learning Openzeppelin
 */

contract OurToken is ERC20 {
    constructor(uint256 _initialSupply) ERC20("OurToken", "OUT") {
        _mint(msg.sender, _initialSupply);
    }
}
