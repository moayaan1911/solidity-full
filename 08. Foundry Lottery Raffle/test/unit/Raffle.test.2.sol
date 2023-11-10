// SPDX-License-Identifier:MIT
import {Test, console} from "forge-std/Test.sol";
import {DeployRaffle} from "../../script/Raffle.script.sol";
import {Raffle} from "../../src/Raffle.sol";

pragma solidity 0.8.21;

contract RaffleTestEnterRaffleFunction is Test {
    Raffle raffle;
    address public USER = makeAddr("ayaan");
    event EnteredRaffle(address indexed player);

    function setUp() external {
        DeployRaffle deployer = new DeployRaffle();
        raffle = deployer.run();
        vm.deal(USER, 10e18); // another SPECIAL FUNCTION from foundry that sets balance value for an address
    }

    function testEnterRaffleReverts_NotEnoughEth() external {
        vm.prank(USER);
        console.log(USER);
        vm.expectRevert(Raffle.RAFFLE__Not_Enough_ETH_Sent.selector);
        raffle.enterRaffle();
    }

    function testEnterRaffle_IncrementPlayersLength() external {
        vm.prank(USER);
        raffle.enterRaffle{value: 0.02 ether}();
        console.log(raffle.totalPlayers());
        assertEq(raffle.totalPlayers(), 1);
    }

    function testEnterRaffle_GetParticularPlayer() external {
        vm.prank(USER);
        raffle.enterRaffle{value: 0.02 ether}();
        assertEq(raffle.getParticularPlayer(0), USER);
    }

    function testEnterRaffle_EventEmitted() external {
        vm.prank(USER);
        vm.expectEmit(true, false, false, false, address(raffle));
        emit EnteredRaffle(USER);
        raffle.enterRaffle{value: 0.02 ether}();
    }

    function testEnterRaffle_RevertRaffleNotOpen() external {
        vm.prank(USER);
        raffle.enterRaffle{value: 0.02 ether}();
        vm.warp(block.timestamp + 31);
        raffle.performUpkeep("");
        vm.expectRevert(Raffle.RAFFLE__Raffle_Not_Open.selector);
        vm.prank(USER);
        raffle.enterRaffle{value: 0.02 ether}();
    }
}
