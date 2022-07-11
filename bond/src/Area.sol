// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";
// import "solmate/auth/Owned.sol";

import "./interfaces/IFarmer.sol";

contract Area is ERC1155("https://potato.bond/api/v1/{id}") {
    

    /// ### Storage ##################

    IFarmer F;
    IERC721 C;
    IERC721 B;

    mapping(uint256 => address) areaIdCustomRulesContract;
    mapping(uint256 => address) areaGovernor; /// @dev alternative: isFarmer[0[InArea OR Gov == CustomRules 
    mapping(uint256 => uint256[]) areaParticipantId; /// @dev areaID, uint256[][uint256(uint160(_who))] = participantID - how stupid is this?
    mapping(address => address) farmChain;

    uint256 public globalId;
    /// ### Modifiers ##################


    /// @dev good way to execute arbitrary code. assess risk scope
    modifier CustomAreaRules(uint256 _areaID){
        require( __customRulesBefore(_areaID, msg.sig));
        _;
        require(__customRulesAfter(_areaID, msg.sig));
    }

    /// ### Errors ##################

    /// ### Public ##################

    /// ### External ##################
    function becomeFarmer(uint256 _areaID, string memory _uri) external returns (uint256 farmerId) {
        require(! belongsTo(msg.sender, _areaID), "Already in");
        globalIncrement();
        farmerId = F.balanceOf(msg.sender);

        if (belongsTo(farmChain[msg.sender], _areaID)) {
             areaParticipantId[_areaID][uint256(uint160(msg.sender))] = globalId;
             /// Call Farmer to mint to msg.sender
            _mintFarmer(msg.sender, globalId, _uri);
            require(farmerId < F.balanceOf(msg.sender), 'mint failed');
            farmerId = globalId;
            /// increment farmert
        }

        if(areaParticipantId[_areaID].length == 0 ) {
            return 0; /// no farmer in existence to chain to.
        }
    }

    function becomeCustomer(uint256 _areaID) external returns (uint256 farmerId)  {
        globalIncrement();
        return 1;
    }


    function _changeCustumAreaRules(uint256 _areaID, address _newRulesAddress) external returns(bool) {
        require(areaGovernor[_areaID] == msg.sender, "Unauthorized");
        areaIdCustomRulesContract[_areaID] = _newRulesAddress;
    } 

    /// ### Private ##################
    function __customRulesBefore(uint256 areaId, bytes4 funcSing) private returns (bool) {
        true;
    }

    function __customRulesAfter(uint256 areaId, bytes4 funcSing) private returns (bool) {
        true;
    }

    function globalIncrement() private returns (uint256) {
        unchecked { ++ globalId; }
    }

    function _mintFarmer(address _becomesFarmer, uint256 _id, string memory _uri) private {
        return F.mintFarmer(_becomesFarmer, _id, _uri);
    }

    /// ### View ##################

        function belongsTo(address who, uint256 areaId) public view returns (bool) {
            if (areaParticipantId[areaId][uint256(uint160(who))] != 0) return true; 
        }
}
