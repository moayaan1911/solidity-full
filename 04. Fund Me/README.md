<!-- @format -->

# Chapter 4: Fund Me

## Description

In Chapter 4, we delve into the "Fund Me" Solidity smart contract. This contract allows users to fund a pool with a minimum value in USD. The contract leverages Chainlink price feeds to fetch conversion rates between Ether and USD, and it's packed with essential Solidity concepts.

# VIDEO TUTORIAL for this section

[Patrick Collins Foundry Solidity Bootcamp](https://www.youtube.com/watch?v=umepbfKp5rI&t=14948s)

## Solidity Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint private constant MINIMUM_USD_VALUE = 5e18;
    mapping (address => uint) public addressToEth;
    uint public balance;
    address[] public funders;
    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(getConversionRate(msg.value) > MINIMUM_USD_VALUE, "Minimum 5 USD value needed");
        balance += msg.value;
        funders.push(msg.sender);
        addressToEth[msg.sender] = msg.value;
    }

    function getPrice() private view returns (uint256) {
        (, int256 answer,,,) = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).latestRoundData();
        return uint256(answer * 1e10);
    }

    function getConversionRate(uint256 ethAmount) private view returns (uint256) {
        uint256 latestPrice = getPrice();
        uint256 EthInUSD = (ethAmount * latestPrice) / 1e18;
        return EthInUSD;
    }

    modifier onlyOwner() {
        require(msg.sender == i_owner, "NOT THE OWNER");
        _;
    }

    function withdraw() public onlyOwner {
        for (uint i = 0; i < funders.length; i++) {
            address funder = funders[i];
            addressToEth[funder] = 0;
        }
        funders = new address[](0);
        balance = 0;
        payable(msg.sender).transfer(address(this).balance);
    }
}
```

## Code Explanation

- **MINIMUM_USD_VALUE**: A private constant representing the minimum USD value needed to fund the contract.

- **addressToEth**: A mapping that stores the amount of Ether sent by each address.

- **balance**: A public variable that tracks the contract's balance.

- **funders**: An array that stores the addresses of users who funded the contract.

- **i_owner**: An immutable variable storing the contract owner's address.

- **fund()**: A function that allows users to fund the contract, ensuring it meets the minimum USD value requirement.

- **getPrice()**: A private function that retrieves the latest Ether-to-USD conversion rate from a Chainlink price feed.

- **getConversionRate()**: A private function that calculates the Ether amount in USD based on the provided Ether amount and conversion rate.

- **onlyOwner() Modifier**: A modifier that restricts certain functions to be called only by the contract owner.

- **withdraw()**: A function to withdraw the contract's balance, resetting funders' records.

## Glossary

- **Immutable**: An attribute indicating that a state variable's value cannot be changed after initialization.

- **Constants**: Variables with fixed values that cannot be changed during contract execution.

- **Oracles**: External services providing real-world data to smart contracts.

- **Chainlink**: A decentralized oracle network that connects smart contracts with external data sources.

- **Price Feeds**: Data sources that provide information about asset prices, such as cryptocurrency rates.

- **Modifier**: A keyword used to change the behavior of functions or restrict access to them.

- **Transfer**: A function to send Ether from the contract to a specified address.

- **Payable**: A keyword that allows a function to receive Ether.

- **Require**: A Solidity statement to ensure certain conditions are met; otherwise, it reverts the transaction.

- **Constructor**: A special function called during contract deployment.

## Resource Links

- [Chainlink Documentation](https://docs.chain.link/docs)
- [Solidity Documentation](https://docs.soliditylang.org/en/v0.8.19/)
- [Chainlink Price Feeds](https://docs.chain.link/docs/price-feeds/)
