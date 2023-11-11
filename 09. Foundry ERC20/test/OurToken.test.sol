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
