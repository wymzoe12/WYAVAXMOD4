// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    mapping(string => uint256) public sneakerPrices;
    mapping(address => mapping(string => uint256)) public ownedSneakers;

    event SneakerPurchased(address indexed buyer, string sneakerType);

    constructor() ERC20("Degen", "DGN") {
        sneakerPrices["550"] = 100;
        sneakerPrices["Converse"] = 300;
        sneakerPrices["Yeezy"] = 500;
        sneakerPrices["Onitsuka"] = 800;
    }

    function mint(uint256 amount) public onlyOwner {
        _mint(msg.sender, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function buySneaker(string memory sneakerType) public payable {
        require(sneakerPrices[sneakerType] > 0, "Invalid sneaker type");
        require(balanceOf(msg.sender) >= sneakerPrices[sneakerType], "Insufficient balance");

        ownedSneakers[msg.sender][sneakerType] += 1;
        _burn(msg.sender, sneakerPrices[sneakerType]);
        emit SneakerPurchased(msg.sender, sneakerType);
    }

}
