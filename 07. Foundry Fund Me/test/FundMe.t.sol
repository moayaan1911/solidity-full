// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    address immutable USER = makeAddr("user"); // this makeAddr is a special function in foundry that returns an address for a string given

    function setUp() external {
        fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        vm.deal(USER, 10e18); // another SPECIAL FUNCTION from foundry that sets balance value for an address
    }

    function testMinimumDollar() public {
        console.log(fundMe.MINIMUM_USD_VALUE());
        assertEq(fundMe.MINIMUM_USD_VALUE(), 5e18);
    }

    function testOwner() public {
        console.log(fundMe.i_owner());
        assertEq(fundMe.i_owner(), address(this));
    }

    function testVersion() public {
        uint256 version = fundMe.getVersion();
        console.log(version);
        assertEq(version, 4);
    }

    function testFundFail() public {
        vm.expectRevert();

        fundMe.fund();
    }

    function testFund() public {
        vm.prank(USER); //another special function of foundry that SENDS the tx from this ADDRESS instead of address(this)
        console.log(USER);
        fundMe.fund{value: 1e18}();
        uint256 amountFunded = fundMe.addressToEth(USER);
        console.log("Amount Funded", amountFunded);
        assertEq(amountFunded, 1e18);
    }

    function testBalance() public {
        vm.prank(USER);
        fundMe.fund{value: 1e18}();
        uint256 balance = fundMe.balance();
        console.log("BALANCE", balance);
        assertEq(balance, 1e18);
    }

    function testFunders() public {
        vm.prank(USER);
        fundMe.fund{value: 1e18}();
        address funder = fundMe.funders(0);
        assertEq(funder, USER);
    }

    function testWithdraw() public {
        vm.prank(USER);
        fundMe.fund{value: 1e18}();
        vm.expectRevert();
        vm.prank(USER);
        fundMe.withdraw();
    }
}
