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
