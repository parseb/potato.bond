// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

import "openzeppelin-contracts/contracts/token/ERC721/IERC721.sol";

interface IFarmer is IERC721 {

    /// @notice returns the token uri for farmer metadata storage location
    /// @param id id of the token for which it retrieves string uri
    function tokenURI(uint256 id) external view returns (string memory);


    /// @notice mints new farmer to given address
    /// @param _to address of owner of created farmer token
    /// @param _id type (farmer)
    /// @param _uri farmer metadata location
    function mintFarmer(address _to, uint256 _id, string memory _uri) external; 

    function getIdOf(address _who) external returns (uint);
}