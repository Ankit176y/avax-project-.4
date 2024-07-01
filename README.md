# Project: Degen Token (ERC-20): Unlocking the Future of Gaming

DegenToken is a custom ERC20 token built on the Ethereum blockchain. This smart contract allows minting, transferring, redeeming, and burning tokens. It also includes an in-game store where tokens can be redeemed for items.

## Description

Degen Token is designed to serve as a reward and utility token for a gaming platform. The platform owner can mint new tokens and distribute them as rewards to players. Players can transfer tokens to each other, redeem them for items in the in-game store, and burn tokens they no longer need. The contract leverages OpenZeppelin's ERC20 implementation for standard token functionality and Ownable for access control, ensuring that only the contract owner can mint new tokens.

## ERC20 standard interface has following functions and events:

1. Total Supply: The total number of tokens that will ever be issued

2. Balance Of: The account balance of a token owner's account

3. Transfer: Automatically executes transfers of a specified number of tokens to a specified address for transactions using the token

4. Transfer From: Automatically executes transfers of a specified number of tokens from a specified address using the token

5. Approve: Allows a spender to withdraw a set number of tokens from a specified account, up to a specific amount

6. Transfer: An event triggered when a transfer is successful (an event)

7. Approval: A log of an approved event (an event)

## Prerequisites

1. Remix IDE: An online IDE for Solidity smart contract development.

2. MetaMask: A browser extension for interacting with the Ethereum network.

3. SnowTrace: A powerful blockchain explorer designed for the Avalanche Network.

## Requirements for the project

1. Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.

2. Transferring tokens: Players should be able to transfer their tokens to others.

3. Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.

4. Checking token balance: Players should be able to check their token balance at5. Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.

## Getting Started

### Installing

To get started with the Degen Token contract, you'll need to have the following tools installed:

1. Remix IDE

2. MetaMask

## Executing program

1. Go to Remix IDE.

2. Create a New Solidity File: In the "File Explorer" pane on the left, click the "+" button to create a new file.

3. Name your file GamingToken.sol

4. Copy and paste the following code into GamingToken.sol File

5. Compile the contract using the Solidity compiler in Remix.
   
 ```

pragma solidity ^0.8.20;

// Minting new tokens: The platform should be able to create new to

// Transferring tokens: Players should be able to transfer their to // Redeeming tokens: Players should be able to redeem their tokens

// Checking token balance: Players should be able to check their to

// Burning tokens: Anyone should be able to burn tokens, that they

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol" ;

import "hardhat/console.sol";

contract DegenGamingToken is ERC20, Ownable(msg.sender), ERC20Burnable { constructor() ERC20("Degen", "DGN") {}

struct StoreItem {

string name;

uint256 price;

}
mapping(uint => StoreItem) storeItems;

function addItem() public onlyOwner {

storeItems [1]= StoreItem("lucky spin", 100);

storeItems [2] = StoreItem("20% Cashback on Eth coin", 80);

storeItems [3] =StoreItem("CryptoPunks", 50);

storeItems [4] = StoreItem("Membership", 500);

}
function showStoreItems() public view returns (StoreItem[] memory)

{ StoreItem[] memory items = new StoreItem[](4);

 for (uint256 i=1; i<5; i++) {

items[i] =storeItems[i];

}

return items;

}

function mint(address to, uint256 amount) public onlyOwner {
     _mint(to, amount); // last value is for decimals 
}

function decimals() override public pure returns (uint8) { 
    return 0;

}

function TotalBalance() external view returns (uint256) {

return this.balanceOf(msg.sender);

}

function transferTokens (address _receiver, uint256 _value) external {
 require(balanceOf(msg.sender) >= _value, "You do not have enough balance");
 approve(msg.sender, _value);
transferFrom(msg.sender, _receiver, _value);
}
function burnTokens (uint256 _value) external {

require(balanceOf(msg.sender) >= _value, "You do not have token");
_burn(msg.sender, _value);

}

function redeemToken (uint256 _itemIndex) external payable {
     require(_itemIndex < 5, "Invalid item index");
      StoreItem memory item= storeItems [_itemIndex];
       require(balanceOf(msg.sender) >= item.price, "You do not have enough balance");
        _burn(msg.sender, item.price);
         payable(msg.sender).transfer (msg.value);

}

// Fallback function to accept Avax

receive() external payable {}
}

```
   
## Deploy the contract:

1. Select "Injected Web3" as the environment in the Remix IDE.

2. Connect to your MetaMask wallet.

3. Ensure you are connected to the Avalanche C-Chain network.

4. Click "Deploy" and confirm the transaction in MetaMask.

## Verifying on Snow Trace

1. After deploying the contract, copy the contract address from the Remix IDE.

2. Open SnowTrace.

3. Navigate to "Contract" > "Verify and Publish".

4. Enter the contract address and select "Solidity (Single File)" as the Compiler Type.

5. Select the appropriate Solidity Compiler version used in Remix (e.g., 0.8.20).

6. Paste the contract code into the provided text box.

7. Click "Verify and Publish".

8. Once verified, you can interact with your contract directly on SnowTrace

## Authors

Ankit Kumar
