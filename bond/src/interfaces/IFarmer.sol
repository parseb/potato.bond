// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

import "openzeppelin-contracts/contracts/token/ERC721/IERC721.sol";

interface IFarmer is IERC721 {

    /// @notice returns the token uri for farmer metadata storage location
    /// @param id id of the token for which it retrieves string uri
    function tokenURI(uint256 id) external view returns (string memory);

}