// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SimpleLoop{
    uint public result;
    function expensivePure(uint256 n) public pure returns(uint256){
        uint256 sum =0;
        for(uint256 i = 0; i <= n; i++)
        {
            sum += i;
        }
        return sum;
    }
    function callPureInternally()public{
        result = expensivePure(10);
    }
    function findFirstEven(uint[] memory arr) public pure returns (uint) {
        uint i = 0;
        while (i < arr.length) {
            if (arr[i] % 2 == 0) {
                return arr[i]; // exit early
            }
            i++;
        }
        return 0; // not found
}
}