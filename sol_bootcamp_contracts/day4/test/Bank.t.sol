// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {Bank} from "../src/Bank.sol";

contract BankTest is Test {
    Bank public bank;
    address user = address(123);

    function setUp() public {
        bank = new Bank();
        vm.deal(user, 100 ether); // Give user 100 ETH
    }

    /// Test: User can deposit ETH
    function test_UserCanDepositETH() public {
        uint256 depositAmount = 1 ether;

        vm.prank(user);
        bank.deposit{value: depositAmount}();

        assertEq(bank.getBalance(user), depositAmount, "Balance should match deposit");
    }

    /// Test: User can withdraw ETH
    function test_UserCanWithdrawETH() public {
        uint256 depositAmount = 2 ether;
        uint256 withdrawAmount = 1 ether;

        vm.prank(user);
        bank.deposit{value: depositAmount}();

        vm.prank(user);
        bank.withdraw(withdrawAmount);

        assertEq(bank.getBalance(user), depositAmount - withdrawAmount, "Balance should decrease after withdrawal");
    }

    /// Test: Cannot withdraw more than balance
    function test_CannotWithdrawMoreThanBalance() public {
        vm.prank(user);
        bank.deposit{value: 1 ether}();

        vm.prank(user);
        vm.expectRevert("Insufficient balance");
        bank.withdraw(2 ether);
    }

    /// Test: Balance updates correctly after operations
    function test_BalanceUpdatesCorrectly() public {
        vm.prank(user);
        bank.deposit{value: 5 ether}();

        assertEq(bank.getBalance(user), 5 ether, "Balance should be 5 ether after deposit");

        vm.prank(user);
        bank.withdraw(2 ether);

        assertEq(bank.getBalance(user), 3 ether, "Balance should be 3 ether after withdrawal");
    }

    /// Test: Revert works properly on zero deposit
    function test_RevertOnZeroDeposit() public {
        vm.prank(user);
        vm.expectRevert("Deposit amount must be greater than 0");
        bank.deposit{value: 0}();
    }

    /// Test: Revert works properly on zero withdrawal
    function test_RevertOnZeroWithdraw() public {
        vm.prank(user);
        bank.deposit{value: 1 ether}();

        vm.prank(user);
        vm.expectRevert("Withdraw amount must be greater than 0");
        bank.withdraw(0);
    }
}   