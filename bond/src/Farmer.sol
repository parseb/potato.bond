// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "solmate/tokens/ERC721.sol";
import "solmate/auth/Owned.sol";


struct F {
    uint256 area_id;
    uint256[2] AIF; // amount [ issued , fulfilled ]
    string data_url;
}


contract Farmer is ERC721("Farmer", "FArM"), Owned(msg.sender) {


    mapping(uint256 => string) farmerIdURI;

    constructor(address _Area) {
        owner = _Area;
    }

    function tokenURI(uint256 id) public view override(ERC721) returns (string memory) {
        return farmerIdURI[id];
    }

    function mintFarmer(address _to, uint256 _id, string memory _uri) external onlyOwner() returns(bool s) {
        uint b0 = balanceOf(_to);
        farmerIdURI[_id] = _uri;
        _safeMint(_to, _id);
        s= (b0 < balanceOf(_to));
    } 


    /// Override ////////////////////////


    function transferFrom(
        address from,
        address to,
        uint256 id
    ) public override {
        if (to != address(0) || from != address(0)) revert("Role not transferable");

        super.transferFrom(from,to,id);
    } 

    function approve(address spender, uint256 id) public override {
        revert("C'est ne pas possible.");
     }

     function setApprovalForAll(address operator, bool approved) public override {
        revert("C'est ne pas possible.");
     }


}
