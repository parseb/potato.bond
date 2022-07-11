// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "solmate/tokens/ERC721.sol";
import "solmate/auth/Owned.sol";


contract Basket is ERC721("Farm Basket","POTATO"), Owned(msg.sender) {


    mapping(uint256 => string) internal basketIdURI;


    constructor(address _Area) {
        owner = _Area;
    }


    function tokenURI(uint256 id) public view override(ERC721) returns (string memory) {
        return basketIdURI[id];
    }

}
