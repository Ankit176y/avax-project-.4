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

storeItems [1]= StoreItem("lucky spin", 200);

storeItems [2] = StoreItem("20% Cashback on Eth coin", 180);

storeItems [3] =StoreItem("CryptoPunks", 50);

storeItems [4] = StoreItem("Membership", 600);

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