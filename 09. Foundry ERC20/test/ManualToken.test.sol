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
