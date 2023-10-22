<!-- @format -->

# Chapter 3: Storage Factory

Welcome to Chapter 3 of the Blockchain Basics course. In this chapter, we explore three Solidity contracts: `SimpleStorage`, `StorageFactory`, and `AddFiveStorage`. These contracts introduce concepts such as importing other contracts, creating arrays of contracts, function overriding, and contract interaction. Below, you'll find resources and links to the available content.

# VIDEO TUTORIAL for this section

[Patrick Collins Foundry Solidity Bootcamp](https://www.youtube.com/watch?v=umepbfKp5rI&t=12598s)

## Solidity Code

### SimpleStorage Contract

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
```

### StorageFactory Contract

```solidity
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
```

### AddFiveStorage Contract

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    function store(uint _favouriteNumber) public override {
        myFavoriteNumber = _favouriteNumber + 5;
    }
}
```

## Code Explanation

### SimpleStorage Contract

- `uint256 myFavoriteNumber`: A state variable that stores a favorite number.
- `struct Person`: Defines a custom data structure for people, including their favorite number and name.
- `Person[] public listOfPeople`: An array to store instances of the `Person` struct.
- `mapping(string => uint256) public nameToFavoriteNumber`: A mapping that associates names with favorite numbers.
- `store(uint256 _favoriteNumber)`: A function to set the favorite number.
- `retrieve()`: A function to get the stored favorite number.
- `addPerson(string memory _name, uint256 _favoriteNumber)`: A function to add a person's details to the list.

### StorageFactory Contract

- `SimpleStorage[] public listOfSimpleStorageContracts`: An array to store instances of the `SimpleStorage` contract.
- `createSimpleStorage()`: Creates a new `SimpleStorage` contract instance and adds it to the list.
- `store(uint _simpleStorageIndex, uint256 number)`: Calls the `store` function of a specific `SimpleStorage` contract.
- `retrieve(uint _simpleStorageIndex)`: Calls the `retrieve` function of a specific `SimpleStorage` contract.

### AddFiveStorage Contract

- Inherits from the `SimpleStorage` contract.
- Overrides the `store` function to add five to the favorite number.

## Glossary

- **Inheritance**: In Solidity, a contract can inherit properties and methods from another contract.
- **Import**: Allows a contract to use the functions and variables of another contract.
- **Virtual Function**: A function marked as `virtual` can be overridden in derived contracts.
- **Override**: In a derived contract, the `override` keyword is used to define a function that replaces a function in the parent contract.
- **Mapping**: A data structure that associates keys with values.
- **Deployment**: The process of creating and deploying a smart contract to the blockchain.

## Resource Links

- [Solidity Documentation](https://docs.soliditylang.org/en/latest/)
- [Solidity Inheritance](https://soliditylang.org/docs/latest/contracts.html#inheritance)
- [Remix IDE](https://remix.ethereum.org)
- [Ethereum Development Resources](https://ethereum.org/developers/#developer-tools)
