# Solidity Bootcamp - Day 3: Inheritance and Libraries

## Overview
This project demonstrates two key Solidity concepts:
1. **Inheritance** - Creating base and child contracts
2. **Libraries** - Creating reusable library functions

## Task 1: Inheritance

### Contracts
- **Animal** (Base Contract)
  - `speak()` - Virtual function that returns "Animal sound"

- **Dog** (Child Contract)
  - Overrides `speak()` to return "Wof Wof!"

- **Cat** (Child Contract)
  - Overrides `speak()` to return "Meow"

### Key Concepts
- `virtual` - Marks a function that can be overridden
- `override` - Used in child contracts to override parent functions
- `is` - Keyword for inheritance

## Task 2: Library

### MathLib Library
Provides two utility functions:
- `sub(uint a, uint b)` - Subtracts b from a with underflow protection
- `multiply(uint a, uint b)` - Multiplies two unsigned integers

### Calculator Contract
Uses MathLib to perform calculations:
- `subtract(uint a, uint b)` - Returns a - b
- `product(uint a, uint b)` - Returns a * b

### Key Concepts
- `library` - Reusable code that cannot hold state
- `using X for Y` - Attaches library functions to types
- `internal` - Library functions are internal for gas efficiency

## How to Use

1. Copy `Day3.sol` to your Solidity project
2. Compile with Solidity ^0.8.13 or higher
3. Deploy the contracts to your desired network

## Testing Example

```solidity
// Deploy contracts
Dog dog = new Dog();
Cat cat = new Cat();
Calculator calc = new Calculator();

// Test inheritance
dog.speak(); // Returns "Wof Wof!"
cat.speak(); // Returns "meow!"

// Test library
calc.subtract(10, 3); // Returns 7
calc.product(5, 4); // Returns 20