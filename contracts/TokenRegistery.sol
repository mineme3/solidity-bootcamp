// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TokenRegistry {
    // Struct to represent a token
    struct Token {
        string name;
        string symbol;
        address owner;
        bool isActive;
    }

    // Mapping to store tokens by ID
    mapping(uint256 => Token) public tokens;

    // Array to track all registered token IDs
    uint256[] public tokenIds;

    // Counter for auto-incrementing token IDs
    uint256 private tokenIdCounter = 1;

    // Event for when a new token is registered
    event TokenRegistered(
        uint256 indexed tokenId,
        string name,
        string symbol,
        address indexed owner
    );

    // Event for when a token is deactivated
    event TokenDeactivated(uint256 indexed tokenId, address indexed owner);

    // Modifier to check if caller is token owner
    modifier onlyTokenOwner(uint256 id) {
        require(tokens[id].owner == msg.sender, "Only token owner can deactivate");
        _;
    }

    // Modifier to check if token exists
    modifier tokenExists(uint256 id) {
        require(id > 0 && id < tokenIdCounter, "Token does not exist");
        _;
    }

    // Register a new token with auto-incremented ID
    function registerToken(string memory name, string memory symbol) public {
        // Check for empty name or symbol
        require(bytes(name).length > 0, "Token name cannot be empty");
        require(bytes(symbol).length > 0, "Token symbol cannot be empty");

        uint256 tokenId = tokenIdCounter;

        // Create and store the token
        tokens[tokenId] = Token({
            name: name,
            symbol: symbol,
            owner: msg.sender,
            isActive: true
        });

        // Add token ID to the array
        tokenIds.push(tokenId);

        // Emit event
        emit TokenRegistered(tokenId, name, symbol, msg.sender);

        // Increment counter for next token
        tokenIdCounter++;
    }

    // Deactivate a token (only owner can do this)
    function deactivateToken(uint256 id)
        public
        tokenExists(id)
        onlyTokenOwner(id)
    {
        require(tokens[id].isActive, "Token is already inactive");

        tokens[id].isActive = false;

        // Emit event
        emit TokenDeactivated(id, msg.sender);
    }

    // Get all information about a token
    function getToken(uint256 id)
        public
        view
        tokenExists(id)
        returns (Token memory)
    {
        return tokens[id];
    }

    // Get all registered token IDs
    function getAllTokenIds() public view returns (uint256[] memory) {
        return tokenIds;
    }

    // Get the total number of registered tokens
    function getTokenCount() public view returns (uint256) {
        return tokenIds.length;
    }

    // Check if a token is active
    function isTokenActive(uint256 id) public view tokenExists(id) returns (bool) {
        return tokens[id].isActive;
    }
}