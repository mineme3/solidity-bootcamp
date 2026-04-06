// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStorage {
    uint256 public storedNumber;

    function store(uint256 _number) public {
        storedNumber = _number;
    }

    function retrieve() public view returns (uint256) {
        return storedNumber;
    }

    // Bonus: increment function
    function increment() public {
        storedNumber += 1;
    }
}   
