// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import "../lib/chainlink-brownie-contracts/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// we can import interface like this also :-
// interface AggregatorV3Interface {
//   function decimals() external view returns (uint8);

//   function description() external view returns (string memory);

//   function version() external view returns (uint256);

//   function getRoundData(
//     uint80 _roundId
//   ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

//   function latestRoundData()
//     external
//     view
//     returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
// }
contract FundMe {
    uint public constant MINIMUM_USD_VALUE = 5e18; // we use 5e18 instead of 5 because the msg.value is calculated in wei so EVEN IF my ethInUSD returns in ETH, the msg.value is in WEI so I need to add 1e18 to 5
    mapping(address => uint) public addressToEth;
    uint public balance;
    address[] public funders;
    address public immutable i_owner;
    AggregatorV3Interface private immutable i_priceFeedAddress;

    constructor(address priceFeedAddress) {
        i_owner = msg.sender;
        i_priceFeedAddress = AggregatorV3Interface(priceFeedAddress);
    }

    function fund() public payable {
        require(
            getConversionRate(msg.value) > MINIMUM_USD_VALUE,
            "Minimum 5 usd value needed"
        );
        balance += msg.value;
        funders.push(msg.sender);
        addressToEth[msg.sender] = msg.value;
    }

    function getPrice() private view returns (uint256) {
        (, int256 answer, , , ) = i_priceFeedAddress.latestRoundData();
        return uint256(answer * 1e10); // the answer has 8 decimal places AND msg.value has 18, so we will add 10 more decimal places and then return it. Also uint because the msg.value is uint
    }

    function getConversionRate(
        uint256 ethAmount
    ) private view returns (uint256) {
        uint256 latestPrice = getPrice();
        uint256 EthInUSD = (ethAmount * latestPrice) / 1e18;
        // uint256 EthInUSD = ethAmount * latestPrice;
        return EthInUSD;
    }

    modifier onlyOwner() {
        require(msg.sender == i_owner, "NOT THE OWNER");
        _;
    }

    function withdraw() public onlyOwner {
        // reset the mapping
        for (uint i = 0; i < funders.length; i++) {
            address funder = funders[i];
            addressToEth[funder] = 0;
        }
        funders = new address[](0); //reset the array
        balance = 0;
        payable(msg.sender).transfer(address(this).balance);
    }

    function getVersion() public view returns (uint256) {
        return i_priceFeedAddress.version();
    }

    // Explainer from: https://solidity-by-example.org/fallback/
    // Ether is sent to contract
    //      is msg.data empty?
    //          /   \
    //         yes  no
    //         /     \
    //    receive()?  fallback()
    //     /   \
    //   yes   no
    //  /        \
    //receive()  fallback()

    fallback() external payable {
        fund();
    }

    receive() external payable {
        fund();
    }
}
