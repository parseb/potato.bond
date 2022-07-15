// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "ERC721A/ERC721A.sol";

import "solmate/auth/Owned.sol";
import "./interfaces/IArea.sol";


contract Basket is ERC721A("Basket","POTATO"), Owned(msg.sender) {

    mapping(uint256 => string) internal basketIdURI;
    
    IArea A;
    constructor(address _Area) {
        owner = _Area;
        A = IArea(_Area);
        _currentIndex = A.getCurrentGId();
    }

//// 

    function printBasket(uint start, uint quantity, address to, string memory uri) external onlyOwner returns (bool s) {
        uint beforeSupply = balanceOf(to);

         _currentIndex = A.getCurrentGId();
        for(start; start < (quantity + _currentIndex);) { 
            basketIdURI[start] = uri;
            unchecked { ++start; }
        }

        _mint(to, quantity);

        s= beforeSupply + quantity == balanceOf(to);
        
        require(s, "Mint balance check failed");
    }

    // function _mint(address to, uint256 quantity) invernal override {

    //     super._mint(to, quantity)
    // }



//// View

    function tokenURI(uint256 id) 
    public 
    view 
    override 
    returns (string memory farmerUri) {
        return basketIdURI[id];
    }

}
    
    
