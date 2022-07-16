// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "parseb/solmate@777/src/tokens/ERC721.sol";


import "parseb/solmate@777/src/auth/Owned.sol";

struct C {
    uint256 area_id;
    uint256[2] balances; // [ Pending , Claimed ]
    string data_url;
}

contract Consumer is ERC721("Consumer", "EATS"), Owned(msg.sender) {


    mapping(uint256 => string) consumerIdURI;
    mapping(address => uint) consummerById;
    constructor(address _Area) {
        owner = _Area;
    }


    function tokenURI(uint256 id) public view override(ERC721) returns (string memory) {
        return consumerIdURI[id];
    }

    function mintConsumer(address _to, uint256 _id, string memory _uri) external onlyOwner() returns(bool) {
        _safeMint(_to, _id);
        consummerById[_to] = _id;
        consumerIdURI[_id] = _uri;
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

     function getIdOfConsummer(address _c) public view returns (uint) {
        return consummerById[_c];
     }

}
