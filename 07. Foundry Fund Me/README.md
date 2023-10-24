# FundMe Module

In the FundMe module, you will learn about writing a FundMe contract using Foundry, a versatile toolkit for Ethereum application development written in Rust. This module covers key commands, a testing script, and a deployment script.

## Commands Learned

1. `vm.prank(ADDRESS)`: A special function in Foundry for sending a transaction to the smart contract from a specific address mentioned within the address parameter.
2. `address immutable USER = makeAddr("user")`: The `makeAddr` function in Foundry returns an address for the given string.
3. `vm.deal(USER, 10e18)`: Another special function in Foundry that sets the balance value for a specific address.
4. `forge test --match-test testWithdraw --fork-url $RPC -vv`: This command runs a specific function as tests for a particular RPC. The `-vv` option prints console output for debugging.

## Test File

```solidity
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    address immutable USER = makeAddr("user"); // The `makeAddr` function returns an address for the given string.

    function setUp() external {
        fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        vm.deal(USER, 10e18); // Sets the balance value for an address.
    }

    // Explanation for each test function line by line
    // ...

    // More test functions and explanations
    // ...
}
```

### Testing Script (FundMeTest.sol)

1. **FundMeTest Contract**: This Solidity script defines the `FundMeTest` contract, which is used for testing the FundMe contract within Foundry.

2. **`setUp` Function**: The `setUp` function, declared as `external`, initializes the `fundMe` variable with a new instance of the FundMe contract and sets the balance for a user address (`USER`) to 10^18 (1 ETH). This function is executed before each test.

3. **Test Functions**: Several test functions are defined, such as `testMinimumDollar`, `testOwner`, `testVersion`, `testFundFail`, `testFund`, `testBalance`, `testFunders`, and `testWithdraw`.

4. **Assert Functions**: In each test function, the `assertEq` function is used to verify whether the expected result matches the actual result.

5. **`vm.expectRevert()`**: In some test functions like `testFundFail` and `testWithdraw`, the `vm.expectRevert()` function is used to check for expected reverts, ensuring that certain conditions are met.


## Deployment Script

```solidity
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {FundMe} from "../src/FundMe.sol";

contract DeployFundMe is Script {
    function run() public returns (FundMe) {
        vm.startBroadcast();
        FundMe fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        vm.stopBroadcast();
        return fundMe;
    }
}
```
### Deployment Script (DeployFundMe.sol)

1. **DeployFundMe Contract**: This Solidity script defines the `DeployFundMe` contract, which is used for deploying an instance of the FundMe contract.

2. **`run` Function**: The `run` function is marked as `public` and returns an instance of the FundMe contract. It is executed to deploy the FundMe contract.

3. **`vm.startBroadcast()` and `vm.stopBroadcast()`**: These functions are used to initiate and stop the broadcasting of transactions. When a contract is deployed, these transactions are broadcast to the Ethereum network.

4. **FundMe Deployment**: Inside the `run` function, a new instance of the FundMe contract is created with the address `0x694AA1769357215DE4FAC081bf1f309aDC325306`.

These scripts are essential for testing and deploying the FundMe contract using Foundry, ensuring that the contract functions as expected and can be deployed successfully on the Ethereum network.



## Documentation

For in-depth documentation and further details on Foundry, please visit [Foundry Documentation](https://book.getfoundry.sh/).

## Usage

Here are some common usage commands for Foundry:

- `forge build`: Build your project.
- `forge test`: Run tests.
- `forge fmt`: Format your code.
- `forge snapshot`: Capture gas snapshots.
- `anvil`: Start a local Ethereum node.
- `forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>`: Deploy a script on particular testnet using private key.
- `forge --help`, `anvil --help`, `cast --help`: Get help and usage information.

Feel free to explore the documentation and these commands to deepen your understanding of Foundry and its capabilities.