# TokenRegistry Smart Contract

A Solidity smart contract for registering and managing tokens on the blockchain.

## Features

- Register new tokens with auto-incremented IDs
- Deactivate tokens (only by owner)
- Retrieve token information by ID
- Get all registered token IDs
- Event emissions for token registration and deactivation
- Input validation (prevents empty names/symbols)

## Contract Functions

### registerToken(string name, string symbol)
Registers a new token with the caller as the owner.
- Sets isActive to true by default
- Assigns auto-incremented ID
- Emits TokenRegistered event
- Reverts if name or symbol is empty

### deactivateToken(uint256 id)
Deactivates a token (only the owner can call this).
- Sets isActive to false
- Emits TokenDeactivated event
- Reverts if caller is not the owner

### getToken(uint256 id)
Returns all information about a token.
- Returns Token struct with name, symbol, owner, and isActive status

### getAllTokenIds()
Returns an array of all registered token IDs.

### getTokenCount()
Returns the total number of registered tokens.

### isTokenActive(uint256 id)
Checks if a specific token is active.

## Events

TokenRegistered: Fired when a new token is registered
TokenDeactivated: Fired when a token is deactivated

## Usage Example

```solidity
// Register a new token
tokenRegistry.registerToken("Bitcoin", "BTC");

// Get token information
Token memory token = tokenRegistry.getToken(1);

// Deactivate a token
tokenRegistry.deactivateToken(1);

// Get all token IDs
uint256[] memory ids = tokenRegistry.getAllTokenIds();