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


      /**
     * @dev Called during each token transfer to set the 24bit `extraData` field.
     * Intended to be overridden by the cosumer contract.
     *
     * `previousExtraData` - the value of `extraData` before transfer.
     *
     * Calling conditions:
     *
     * - When `from` and `to` are both non-zero, `from`'s `tokenId` will be
     * transferred to `to`.
     * - When `from` is zero, `tokenId` will be minted for `to`.
     * - When `to` is zero, `tokenId` will be burned by `from`.
     * - `from` and `to` are never both zero.
     */
    function _extraData(
        address from,
        address to,
        uint24 previousExtraData
    ) internal view override returns (uint24) {}

    /**
     * @dev Hook that is called before a set of serially-ordered token ids are about to be transferred.
     * This includes minting.
     * And also called before burning one token.
     *
     * startTokenId - the first token id to be transferred
     * quantity - the amount to be transferred
     *
     * Calling conditions:
     *
     * - When `from` and `to` are both non-zero, `from`'s `tokenId` will be
     * transferred to `to`.
     * - When `from` is zero, `tokenId` will be minted for `to`.
     * - When `to` is zero, `tokenId` will be burned by `from`.
     * - `from` and `to` are never both zero.
     */
    function _beforeTokenTransfers(
        address from,
        address to,
        uint256 startTokenId,
        uint256 quantity
    ) internal override {}

    /**
     * @dev Hook that is called after a set of serially-ordered token ids have been transferred.
     * This includes minting.
     * And also called after one token has been burned.
     *
     * startTokenId - the first token id to be transferred
     * quantity - the amount to be transferred
     *
     * Calling conditions:
     *
     * - When `from` and `to` are both non-zero, `from`'s `tokenId` has been
     * transferred to `to`.
     * - When `from` is zero, `tokenId` has been minted for `to`.
     * - When `to` is zero, `tokenId` has been burned by `from`.
     * - `from` and `to` are never both zero.
     */
    function _afterTokenTransfers(
        address from,
        address to,
        uint256 startTokenId,
        uint256 quantity
    ) internal override {}




//// View

    function tokenURI(uint256 id) 
    public 
    view 
    override 
    returns (string memory farmerUri) {
        return basketIdURI[id];
    }



}
    
    
