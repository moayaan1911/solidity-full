// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorage() public {
        listOfSimpleStorageContracts.push(new SimpleStorage());
    }

    function store(uint _simpleStorageIndex, uint256 number) public {
        listOfSimpleStorageContracts[_simpleStorageIndex].store(number);
    }

    function retrieve(uint _simpleStorageIndex) public view returns (uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}
