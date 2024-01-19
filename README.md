# DegenToken Smart Contract

## Overview

The DegenToken smart contract is an Ethereum-based ERC-20 token that also incorporates functionality for purchasing sneakers using the token.

## Token Details

- **Name:** Degen
- **Symbol:** DGN

## Sneakers

The smart contract introduces a sneaker purchasing mechanism, allowing users to buy different types of sneakers using the Degen token. The supported sneaker types and their prices are as follows:

1. **Nike 550**
   - Price: 100 DGN

2. **Converse**
   - Price: 300 DGN

3. **Yeezy**
   - Price: 500 DGN

4. **Onitsuka Tiger**
   - Price: 800 DGN

## Smart Contract Functions

### `mint(uint256 amount)`

The `mint` function allows the contract owner to mint additional Degen tokens.

### `burn(uint256 amount)`

The `burn` function allows any token holder to burn a specified amount of their Degen tokens.

### `transfer(address to, uint256 amount)`

The `transfer` function enables token holders to transfer Degen tokens to another address.

### `buySneaker(string memory sneakerType)`

The `buySneaker` function allows users to purchase sneakers using their Degen tokens. Users specify the type of sneaker they want to buy, and the corresponding amount is deducted from their Degen token balance. The ownership of the purchased sneakers is tracked in the `ownedSneakers` mapping.

## Sneaker Purchased Event

The contract emits a `SneakerPurchased` event whenever a user successfully purchases a sneaker. The event includes the buyer's address and the type of sneaker purchased.
