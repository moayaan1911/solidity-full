<!-- @format -->

# Chapter 2: Simple Storage Contract

## Overview

In this chapter, we'll explore a basic Solidity smart contract, "SimpleStorage." This contract allows you to store and retrieve a single integer, representing your favorite number. We'll provide code explanations and steps to run the contract using Remix, an online Solidity IDE.

## Solidity Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 favouriteNumber;

    function setFavouriteNumber(uint256 _x) public {
        favouriteNumber = _x;
    }

    function getFavouriteNumber() public view returns (uint256) {
        return favouriteNumber;
    }
}
```

The contract includes a state variable `favouriteNumber`, two functions, `setFavouriteNumber` to set the favorite number, and `getFavouriteNumber` to retrieve it.

## Code Explanation

### `uint256 favouriteNumber;`

- This line declares a state variable to store an unsigned integer (uint256).
- It will store the favorite number set by the contract owner.

### `function setFavouriteNumber(uint256 _x) public {...}`

- This function allows the contract owner to set their favorite number.
- `_x` is the input parameter that represents the new favorite number.

### `function getFavouriteNumber() public view returns (uint256) {...}`

- This function allows anyone to read (view) the favorite number without modifying it.
- It returns the value of `favouriteNumber`.

## Running the Contract on Remix

To run the SimpleStorage contract on Remix (remix.ethereum.org), follow these steps:

1. Open your web browser and go to [Remix](https://remix.ethereum.org).

2. Create a new Solidity file (e.g., `SimpleStorage.sol`).

3. Copy and paste the SimpleStorage contract code into the file.

4. Select the appropriate Solidity version by clicking on the compiler version tab.

5. Click "Compile" to compile the contract code.

6. Once successfully compiled, go to the "Deploy & Run Transactions" tab.

7. Ensure you have an Ethereum development environment connected (e.g., JavaScript VM or Injected Web3).

8. Deploy the contract by clicking the "Deploy" button.

9. You can then interact with the contract by setting and retrieving your favorite number.

## Resource Links

- [Solidity Documentation](https://docs.soliditylang.org/en/v0.8.18/)
- [Remix IDE](https://remix.ethereum.org)
- [Ethereum Development Environment Setup](https://ethereum.org/developers/#developer-tools)
