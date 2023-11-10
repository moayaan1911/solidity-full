// SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

/**
 * @title Raffle Contract
 * @author moayaan.eth
 * @notice A Simple raffle contract
 * @dev Implementing Chainlink VRF2 and automation
 */

import {VRFCoordinatorV2Interface} from "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import {VRFConsumerBaseV2} from "@chainlink/contracts/src/v0.8/vrf/VRFConsumerBaseV2.sol";

contract Raffle is VRFConsumerBaseV2 {
    error RAFFLE__Not_Enough_ETH_Sent(); // custom errors are more gas efficient than errors with string error msgs
    error RAFFLE__Transaction_Failed();
    error RAFFLE__Raffle_Not_Open();
    error RAFFLE__Upkeep_is_False(
        uint256 contractBalance,
        uint256 playersLength,
        uint256 raffleState
    );

    enum RaffleState {
        OPEN,
        CALCULATING
    }
    uint16 private constant CONFIRMATIONS = 3;
    uint32 private constant RANDOM_WORDS = 1;
    uint256 private immutable i_entranceFees;
    uint256 private immutable i_interval;
    uint256 private lastTimeStamp;
    VRFCoordinatorV2Interface private immutable i_coordinatorAddress;
    bytes32 private immutable i_keyHash;
    uint64 private immutable i_subscriptionID;
    address payable[] private players;
    uint32 private immutable i_callbackGasLimit;
    address private recentWinner;
    RaffleState private raffleState;

    event EnteredRaffle(address indexed player); // events are used to print logs during blockchain activity.
    event WinnerPicked(address indexed winner);

    constructor(
        uint256 _entranceFee,
        uint256 _interval,
        address _coordinator,
        bytes32 _keyHash,
        uint64 _subscriptionID,
        uint32 _callbackGasLimit
    ) VRFConsumerBaseV2(_coordinator) {
        i_entranceFees = _entranceFee;
        i_interval = _interval;
        lastTimeStamp = block.timestamp;
        i_coordinatorAddress = VRFCoordinatorV2Interface(_coordinator);
        i_callbackGasLimit = _callbackGasLimit;
        i_keyHash = _keyHash;
        raffleState = RaffleState.OPEN;
        i_subscriptionID = _subscriptionID;
    }

    function enterRaffle() external payable {
        if (msg.value < i_entranceFees) {
            revert RAFFLE__Not_Enough_ETH_Sent();
        }

        if (raffleState != RaffleState.OPEN) {
            revert RAFFLE__Raffle_Not_Open();
        }
        players.push(payable(msg.sender));

        emit EnteredRaffle(msg.sender);
    }

    function performUpkeep(bytes calldata /* performData */) external {
        (bool upKeep, ) = checkUpkeep("");
        if (!upKeep) {
            revert RAFFLE__Upkeep_is_False(
                address(this).balance,
                players.length,
                uint256(raffleState)
            );
        }

        raffleState = RaffleState.CALCULATING;
        /* uint256 requestId = */ i_coordinatorAddress.requestRandomWords(
            i_keyHash,
            i_subscriptionID,
            CONFIRMATIONS,
            i_callbackGasLimit,
            RANDOM_WORDS
        );
    }

    function fulfillRandomWords(
        uint256 /*_requestId*/,
        uint256[] memory _randomWords
    ) internal override {
        uint256 indexOfWinner = _randomWords[0] % players.length;
        address payable winner = players[indexOfWinner];
        recentWinner = winner;
        raffleState = RaffleState.OPEN;
        players = new address payable[](0);
        lastTimeStamp = block.timestamp;
        emit WinnerPicked(winner);
        (bool success, ) = winner.call{value: address(this).balance}("");
        if (!success) {
            revert RAFFLE__Transaction_Failed();
        }
    }

    function checkUpkeep(
        bytes memory /* checkData */
    ) public view returns (bool upkeepNeeded, bytes memory /* performData */) {
        bool timeHasPassed = block.timestamp - lastTimeStamp >= i_interval;
        bool hasEthBalance = address(this).balance > 0;
        bool hasPlayers = players.length > 0;
        bool isOpen = RaffleState.OPEN == raffleState;
        upkeepNeeded = (timeHasPassed && hasEthBalance && hasPlayers && isOpen);
        return (upkeepNeeded, "0x0");
    }

    function getEntraceFee() external view returns (uint256) {
        return i_entranceFees;
    }

    function getRaffleState() external view returns (RaffleState) {
        return raffleState;
    }

    function totalPlayers() external view returns (uint256) {
        return players.length;
    }

    function getParticularPlayer(
        uint256 _index
    ) external view returns (address) {
        return players[_index];
    }
}
