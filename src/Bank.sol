// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title Bank
 * @dev A simple bank contract for depositing, withdrawing, and checking ETH balance.
 */
contract Bank {
    mapping(address => uint256) private balances;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    /**
     * @dev Deposit ETH into the contract.
     */
    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    /**
     * @dev Withdraw ETH from the contract.
     * @param amount The amount to withdraw.
     */
    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdraw amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent, "Failed to send Ether");
        emit Withdrawn(msg.sender, amount);
    }

    /**
     * @dev View the balance of a user.
     * @param user The address to check.
     * @return The ETH balance of the user.
     */
    function getBalance(address user) external view returns (uint256) {
        return balances[user];
    }
}   