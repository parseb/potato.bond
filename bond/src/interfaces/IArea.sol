// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;


interface IArea {

    function getCurrentGId() external view returns (uint256);

    /// @notice returns the metadata storage access url provided an existing id
    /// @param areaID numeric ID of ordered area
    function getAreaMetaData(uint256 areaID) external view returns (string memory);


    /// @notice checks if address part of area; returns bool true if so computes
    /// @param who suspected address, belonging of which to be verified
    /// @param areaID id as identifier of plane on which _who's apartenence will be checked\
    function belongsTo(address who, uint256 areaID) external view returns (bool belongs);

    /// @notice this function might make you a farmer
    ///         caters for a totality of two scenarios
    ///         first, you can create a new area by passing areaID as 0
    ///         second, join an area by specifying its id given an existing invitation
    /// @param _areaID the area in which you were nominated as a farmer pass 0 to create new area
    function becomeFarmer(uint256 _areaID, string memory CID) external returns(string memory farmerUri);

    /// @notice use this to invite a farmer to an area to which you
    function inviteFarmer(address _newFarmer, uint256 _area) external;

    /// @notice entry point for consumers. arbitrary, area specific rules might apply,m example:
    ///         a consumer might become so associated as a result of a direct or secondary market basket acquisition
    /// @param _areaID the area you want to join
    function joinAsConsumer(uint _areaID, string memory CID) external returns (bool s);

    /// @notice function for farmers to mint basket of goods as an ERC721
    ///         a basket is a non fungible token that stands in as a promise to produce the goods it represents to its bearer
    ///         within the advertised terms outlined in the metadata 
    ///         such as specific products and quantities, claimable between the data of & date of
    function mintBaskets(uint _areaID, uint amount, uint price, address erc20,  uint[2] memory _redeamable, string memory CID) external returns(uint);


    function basketTransferCallBack(uint _basketID, bytes calldata data) external returns (bool);
}

interface IRulerContract {
    function basketTransfer(uint basketID, bytes calldata data) external returns (bool);
}