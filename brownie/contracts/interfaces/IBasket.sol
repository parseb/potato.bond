// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

import "./IERC721A.sol";

interface IBasket is IERC721A {

    /// @notice returns the token uri for basket metadata storage location
    /// @param id id of the token for which it retrieves string uri
    function tokenURI(uint256 id) external view returns (string memory);


    /// @notice function that creates baskets
    ///     onlyOnwer (A) - same pattern as Farmer and Consumer
    ///     uses ERC721A 
    /// @param start global index and index of first minted basked
    /// @param quantity how many (of same duplicate) baskets to mint
    /// @param to beneficiary of baskets (farmer, likely)
    /// @param uri metadata storage location (ipfs CID)
    function printBasket(uint start, uint quantity, address to, string memory uri) external returns (bool);
}



