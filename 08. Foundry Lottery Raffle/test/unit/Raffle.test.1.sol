// SPDX-License-Identifier:MIT
import {Test, console} from "forge-std/Test.sol";
import {DeployRaffle} from "../../script/Raffle.script.sol";
import {Raffle} from "../../src/Raffle.sol";

pragma solidity 0.8.21;

contract RaffleTestGetterFunctions is Test {
    Raffle raffle;

    function setUp() external {
        DeployRaffle deployer = new DeployRaffle();
        raffle = deployer.run();
    }

    function testEntranceFees() external {
        console.log(raffle.getEntraceFee());
        assertEq(raffle.getEntraceFee(), 0.01 ether);
    }

    function testRaffleStateOpen() public view {
        assert(raffle.getRaffleState() == Raffle.RaffleState.OPEN);
    }

    function testTotalPlayers() external {
        console.log(raffle.totalPlayers());
        assertEq(raffle.totalPlayers(), 0);
    }
}
