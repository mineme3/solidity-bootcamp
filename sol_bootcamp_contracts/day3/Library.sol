// SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;
library MathLib {

    function sub(uint x, uint y) internal pure returns (uint) {
        require(y <= x, "Math: subtraction overflow");
        return  x - y;
    }
    function multiply(uint x, uint y) internal pure returns (uint) {
        return x*y;
    }
}

contract Culculator{
    using MathLib for uint;
    function add(uint x, uint y) public pure returns(uint) {
        return x+y;
    }
    function subtract(uint x, uint y) public pure returns(uint) {
        return x.sub(y);
    }
    function multiply(uint x, uint y) public pure returns(uint) {
        return x.multiply(y);
    }
}