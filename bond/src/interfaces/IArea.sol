// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;


interface IArea {


    /// @notice returns the metadata storage access url provided an existing id
    /// @param areaID numeric ID of ordered area
    function getAreaMetaData(uint256 areaID) external view returns (string memory);


    /// @notice checks if address part of area; returns bool true if so computes
    /// @param who suspected address, belonging of which to be verified
    /// @param areaId id as identifier of plane on which _who's apartenence will be checked\
    function belongsTo(address who, uint256 areaId) external view returns (bool belongs);

    /// @notice this function might make you a farmer
    /// @param areaId the area in which you were nominated as a farmer
    function becomeFarmer(uint256 areaId) external view returns(uint256 farmerID);

}