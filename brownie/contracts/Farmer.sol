// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "parseb/solmate@777/src/tokens/ERC721.sol";


import "parseb/solmate@777/src/auth/Owned.sol";

struct F {
    uint256 area_id;
    uint256[2] AIF; // amount [ issued , fulfilled ]
    string data_url;
}


contract Farmer is ERC721("Farmer", "FArM"), Owned(msg.sender) {


    mapping(uint256 => string) farmerIdURI;
    mapping(address => uint) idOf;
    constructor(address _Area) {
        owner = _Area;
    }

    function tokenURI(uint256 id) public view override(ERC721) returns (string memory) {
        return farmerIdURI[id];
    }

    function mintFarmer(address _to, uint256 _id, string memory _uri) external onlyOwner() {
        _safeMint(_to, _id);
        farmerIdURI[_id] = _uri;
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

    function _mint(address to, uint256 id) internal override {
        idOf[to] = id;
        _balanceOf[to] == 0 ? super._mint(to, id) : revert("is farmer");
    } 

    function approve(address spender, uint256 id) public override {
        revert("C'est ne pas possible.");
     }

     function setApprovalForAll(address operator, bool approved) public override {
        revert("C'est ne pas possible.");
     }

    function getIdOf(address _who) public view returns(uint) {
        idOf[_who];
    }

}
