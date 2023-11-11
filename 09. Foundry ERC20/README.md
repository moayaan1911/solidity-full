# 09. Foundry ERC20

This chapter in Foundry delves into ERC20 concepts, featuring the `ManualERC20Token` and `OurToken` contracts. Accompanied by testing and deployment scripts, developers can explore and deploy ERC-20 compliant contracts seamlessly using Foundry's robust toolkit.

## Smart Contract One 
```solidity
// SPDX-License-Identifier:MIT
pragma solidity 0.8.21;

contract ManualERC20Token {
    mapping(address => uint) balances;

    function name() external pure returns (string memory) {
        return "Manual Token";
    }

    function symbol() external pure returns (string memory) {
        return "MNT";
    }

    function decimals() external pure returns (uint8) {
        return 18;
    }

    function totalSupply() external pure returns (uint256) {
        return 1e18;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _amount) external {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }
}
```
1. **Mapping for Balances:**
   - The contract uses a mapping (`balances`) to keep track of the token balances associated with each address.

2. **Token Name, Symbol, and Decimals:**
   - The `name` function returns the name of the token as "Manual Token."
   - The `symbol` function returns the symbol of the token as "MNT."
   - The `decimals` function returns the number of decimals for the token, set to 18.

3. **Total Token Supply:**
   - The `totalSupply` function returns the total supply of the token, set to 1e18 (1 followed by 18 zeros).

4. **Check Balance of an Address:**
   - The `balanceOf` function allows querying the balance of a specified address.

5. **Token Transfer:**
   - The `transfer` function enables the sender to transfer a specified amount of tokens to another address.
   - It calculates the sum of previous balances for the sender and the receiver.
   - It updates the balances by deducting the transferred amount from the sender and adding it to the receiver.
   - It includes a check to ensure that the sum of balances after the transfer is equal to the sum of previous balances, providing a basic validation for the correctness of the transfer operation.


## Smart Contract Two 
```solidity
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
```
1. **Inheritance of ERC20:**
   - The contract `OurToken` inherits functionality from the OpenZeppelin ERC20 standard (`ERC20`), which is a widely used implementation of the ERC-20 token standard.

2. **Constructor Initialization:**
   - The `constructor` function initializes the contract upon deployment, accepting an `_initialSupply` parameter.
   - It calls the constructor of the base `ERC20` contract with the token name ("OurToken") and symbol ("OUT") using `ERC20("OurToken", "OUT")`.

3. **Token Minting:**
   - The `_mint` function is then called within the constructor to mint the initial token supply.
   - The tokens are minted to the address of the contract deployer (`msg.sender`) with the specified `_initialSupply`.

4. **License Information:**
   - The contract includes a SPDX license identifier, indicating that it is licensed under the MIT license.

5. **Import Statement:**
   - The contract imports the `ERC20` contract from the OpenZeppelin library, located at `"../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol"`.

6. **Contract Title and Author Information:**
   - The contract is titled "Openzeppelin Smart Contract ERC20" and lists the author as "moayaan.eth."
   - The `notice` indicates that the contract is created for the purpose of learning OpenZeppelin contracts for ERC20 standards.

7. **Development Context:**
   - The `dev` tag specifies that the contract is being used for learning purposes related to OpenZeppelin.


## Testing Scripts
```solidity
// SPDX-License-Identifier:MIT
import {Test, console} from "../lib/forge-std/src/Test.sol";
import {ManualERC20Token} from "../src/ManualToken.sol";
pragma solidity 0.8.21;

contract ManualTokenTest is Test {
    ManualERC20Token manualERC20Token;
    address immutable USER = makeAddr("user");

    function setUp() external {
        manualERC20Token = new ManualERC20Token();
        vm.deal(USER, 10e18);
    }

    function testName() external {
        assertEq(manualERC20Token.name(), "Manual Token");
    }

    function testSymbol() external {
        assertEq(manualERC20Token.symbol(), "MNT");
    }

    function testTotalSupply() external {
        assertEq(manualERC20Token.totalSupply(), 1e18);
    }

    function testDecimals() external {
        assertEq(manualERC20Token.decimals(), 18);
    }

    function testBalanceOf() external {
        assertEq(manualERC20Token.balanceOf(USER), 0);
    }
}
```
1. **Import Statements:**
   - The script imports necessary modules for testing from the Foundry Forge library, including `Test` and `console`.
   - It also imports the `ManualERC20Token` contract from the local source file.

2. **Contract Declaration:**
   - The contract `ManualTokenTest` is declared, inheriting from the `Test` module, indicating that it is a testing script.

3. **Variable Declaration:**
   - `ManualERC20Token manualERC20Token`: Declares an instance of the `ManualERC20Token` contract for testing purposes.
   - `address immutable USER = makeAddr("user")`: Declares an immutable variable representing a user's address.

4. **Setup Function:**
   - The `setUp` function is called before each test to initialize the `manualERC20Token` contract and provide 10e18 tokens to the user (`USER`).

5. **Test Functions:**
   - `testName`: Checks if the `name` function of `manualERC20Token` returns "Manual Token."
   - `testSymbol`: Checks if the `symbol` function of `manualERC20Token` returns "MNT."
   - `testTotalSupply`: Checks if the `totalSupply` function of `manualERC20Token` returns 1e18.
   - `testDecimals`: Checks if the `decimals` function of `manualERC20Token` returns 18.
   - `testBalanceOf`: Checks if the `balanceOf` function of `manualERC20Token` returns 0 for the specified user address (`USER`).

6. **Console Assertions:**
   - The `assertEq` function is used to assert equality in each test, providing a simple way to verify that the actual output matches the expected output.

7. **License Information:**
   - The script includes a SPDX license identifier, indicating that it is licensed under the MIT license.

8. **Pragma Statement:**
   - The `pragma solidity 0.8.21;` statement specifies the Solidity compiler version used for the script.

```solidity
// SPDX-License-Identifier:MIT
import {Test, console} from "../lib/forge-std/src/Test.sol";
import {OurToken} from "../src/OurToken.sol";
import {OurTokenDeploy} from "../script/OurToken.deploy.sol";
pragma solidity 0.8.21;

contract ManualTokenTest is Test {
    OurToken public ourToken;
    OurTokenDeploy public deploy;
    uint256 private constant STARTING_BALANCE = 100 ether;
    address private immutable AYAAN = makeAddr("ayaan");
    address private immutable USER = makeAddr("user");

    function setUp() external {
        deploy = new OurTokenDeploy();
        ourToken = deploy.run();
        vm.prank(msg.sender);
        ourToken.transfer(AYAAN, STARTING_BALANCE);
    }

    function testAyaanBalance() external {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(AYAAN));
    }

    function testAllowanceWorks() external {
        uint256 initialBalance = 1000;
        uint256 transferAmount = 500;
        vm.prank(AYAAN);
        ourToken.approve(USER, initialBalance);

        vm.prank(USER);
        ourToken.transferFrom(AYAAN, USER, transferAmount);

        assertEq(ourToken.balanceOf(USER), transferAmount);
        assertEq(ourToken.balanceOf(AYAAN), STARTING_BALANCE - transferAmount);
    }

    // Test transfer
    function testTransfer() external {
        uint256 amount = 10 ether;

        vm.prank(AYAAN);
        ourToken.transfer(USER, amount);

        assertEq(ourToken.balanceOf(AYAAN), STARTING_BALANCE - amount);
        assertEq(ourToken.balanceOf(USER), amount);
    }

    // Test transferFrom with insufficient allowance
    function testTransferFromInsufficientAllowance() external {
        uint256 amount = 10 ether;

        vm.prank(AYAAN);
        ourToken.approve(USER, 5 ether);

        vm.expectRevert();
        vm.prank(USER);
        ourToken.transferFrom(AYAAN, USER, amount);
    }

    // Test transferFrom with sufficient allowance
    function testTransferFromSufficientAllowance() external {
        uint256 amount = 10 ether;

        vm.prank(AYAAN);
        ourToken.approve(USER, amount);

        vm.prank(USER);
        ourToken.transferFrom(AYAAN, USER, amount);

        assertEq(ourToken.balanceOf(AYAAN), STARTING_BALANCE - amount);
        assertEq(ourToken.balanceOf(USER), amount);
    }

    // Test approve
    function testApprove() external {
        uint256 amount = 10 ether;

        vm.prank(AYAAN);
        ourToken.approve(USER, amount);

        assertEq(ourToken.allowance(AYAAN, USER), amount);
    }
}

```
1. **Import Statements:**
   - The script imports modules for testing (`Test` and `console`) and contracts for testing (`OurToken` and `OurTokenDeploy`) from the Foundry Forge library.

2. **Contract Declarations:**
   - `ManualTokenTest` is declared as a testing script inheriting from the `Test` module.

3. **Variable Declarations:**
   - `OurToken public ourToken`: Declares an instance of the `OurToken` contract for testing.
   - `OurTokenDeploy public deploy`: Declares an instance of the `OurTokenDeploy` contract to facilitate deployment.
   - `uint256 private constant STARTING_BALANCE`: Defines a constant starting balance of 100 ether.
   - `address private immutable AYAAN`: Represents the address "ayaan."
   - `address private immutable USER`: Represents the address "user."

4. **Setup Function:**
   - The `setUp` function initializes the deployment process, transfers a starting balance to "ayaan," and prepares the contract for subsequent tests.

5. **Balance Test for "Ayaan":**
   - `testAyaanBalance`: Checks if the balance of "ayaan" matches the defined starting balance.

6. **Allowance Test:**
   - `testAllowanceWorks`: Tests the functionality of token allowance and transferFrom, ensuring proper deduction from the sender and addition to the receiver.

7. **Transfer Test:**
   - `testTransfer`: Verifies the successful transfer of tokens from "ayaan" to "user."

8. **TransferFrom Tests:**
   - `testTransferFromInsufficientAllowance`: Ensures that attempting a transferFrom with insufficient allowance results in a revert.
   - `testTransferFromSufficientAllowance`: Tests a successful transferFrom when sufficient allowance is granted.

9. **Approve Test:**
   - `testApprove`: Checks if the `approve` function properly sets the allowance for a specified user.


## Deployment Scripts
```solidity
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.21;

import {Script} from "../lib/forge-std/src/Script.sol";
import {ManualERC20Token} from "../src/ManualToken.sol";

contract ManualTokenDeploy is Script {
    function run() external returns (ManualERC20Token) {
        vm.startBroadcast();
        ManualERC20Token manualERC20Token = new ManualERC20Token();
        vm.stopBroadcast();
        return manualERC20Token;
    }
}
```
1. **License Information:**
   - The script includes a license identifier, indicating that the license details are present in a separate file.

2. **Pragma Statement:**
   - The `pragma solidity 0.8.21;` statement specifies the Solidity compiler version used for the script.

3. **Import Statements:**
   - The script imports the `Script` module from the Foundry Forge library and the `ManualERC20Token` contract.

4. **Contract Declaration:**
   - `ManualTokenDeploy` is declared, indicating it's a deployment script inheriting from the `Script` module.

5. **Deployment Function:**
   - The `run` function is the deployment entry point.
   - It initiates a broadcast, creates an instance of `ManualERC20Token`, stops the broadcast, and returns the deployed contract.

```solidity
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.21;

import {Script} from "../lib/forge-std/src/Script.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenDeploy is Script {
    function run() external returns (OurToken) {
        vm.startBroadcast();
        OurToken ourToken = new OurToken(1000 ether);
        vm.stopBroadcast();
        return ourToken;
    }
}
```
1. **License Information:**
   - The script includes a license identifier, indicating that the license details are present in a separate file.

2. **Pragma Statement:**
   - The `pragma solidity 0.8.21;` statement specifies the Solidity compiler version used for the script.

3. **Import Statements:**
   - The script imports the `Script` module from the Foundry Forge library and the `OurToken` contract.

4. **Contract Declaration:**
   - `OurTokenDeploy` is declared, indicating it's a deployment script inheriting from the `Script` module.

5. **Deployment Function:**
   - The `run` function is the deployment entry point.
   - It initiates a broadcast, creates an instance of `OurToken` with an initial supply of 1000 ether, stops the broadcast, and returns the deployed contract.


## Glossary

### 1. Foundry
- **Explanation:** Foundry is a toolkit for Ethereum application development written in Rust. It provides various tools and modules to streamline the development process.
- **Resource Link:** [Foundry GitHub Repository](https://github.com/your_foundry_repository)

### 2. Forge
- **Explanation:** Forge is a component of Foundry, serving as an Ethereum testing framework similar to Truffle, Hardhat, and DappTools. It helps developers test their smart contracts efficiently.
- **Resource Link:** [Forge Documentation](https://forge.getfoundry.sh/)

### 3. ERC-20
- **Explanation:** ERC-20 is a standard interface for fungible tokens on the Ethereum blockchain. It defines a set of rules and functions that Ethereum tokens must adhere to for seamless interaction with other contracts and applications.
- **Resource Link:** [ERC-20 Standard Documentation](https://eips.ethereum.org/EIPS/eip-20)

### 4. Token
- **Explanation:** In the context of Ethereum, a token represents a digital asset created on the blockchain. It can represent various assets like cryptocurrencies, assets in a game, or any other fungible or non-fungible item.
- **Resource Link:** [Understanding ERC-20 Tokens](https://www.investopedia.com/terms/e/erc-20.asp)


## Components:

- **Forge**: Ethereum testing (like Truffle).
- **Cast**: EVM interaction tool.
- **Anvil**: Local Ethereum node (like Ganache).
- **Chisel**: Swift, utilitarian Solidity REPL.


## Usage

```shell
$ forge build
$ forge test
$ forge fmt
$ forge snapshot
$ anvil
$ forge script script/Counter.s.sol:CounterScript --rpc-url <rpc_url> --private-key <private_key>
$ cast <subcommand>
$ forge --help; anvil --help; cast --help
```

For detailed instructions, refer to the [documentation](https://book.getfoundry.sh/).