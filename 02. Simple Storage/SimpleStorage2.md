<!-- @format -->

# Chapter 2: Array and Structs in SimpleStorage

## Overview

In Part 2 of Chapter 2, we explore an extension of the `SimpleStorage` contract. This updated contract includes a custom data structure called `Person` and an array to store instances of `Person`. We'll provide the Solidity code along with explanations and guide you through running the contract on Remix.

## Solidity Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    Person[] private persons;

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        persons.push(Person(_favouriteNumber, _name));
    }

    function getPerson(uint256 index) public view returns (Person memory) {
        require(index < persons.length, "Index out of bounds");
        return persons[index];
    }
}
```

The contract now includes a custom `Person` struct, an array `persons` to store instances of `Person`, and two functions to add a person and retrieve a person's details.

## Code Explanation

### `struct Person { ... }`

- This section defines a custom data structure `Person` with two properties: `favouriteNumber` and `name`.

### `Person[] private persons;`

- Here, we declare a private array `persons` to store instances of the `Person` struct.

### `function addPerson(string memory _name, uint256 _favouriteNumber) public { ... }`

- This function allows users to add a new `Person` to the `persons` array with a name and a favorite number.

### `function getPerson(uint256 index) public view returns (Person memory) { ... }`

- The `getPerson` function retrieves the details of a `Person` by providing their index in the `persons` array.

## Running the Contract on Remix

To run the updated SimpleStorage contract on Remix, follow the same steps mentioned in Part 1 of Chapter 2.

## Resource Links

- [Solidity Documentation](https://docs.soliditylang.org/en/v0.8.19/)
- [Remix IDE](https://remix.ethereum.org)
- [Ethereum Development Environment Setup](https://ethereum.org/developers/#developer-tools)
