// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";
import "solmate/auth/Owned.sol";

contract Area is ERC1155("https://potato.bond/api/v1/{id}") {
    

    /// ### Storage ##################

    mapping(uint256 => address) areaIdCustomRulesContract;
    mapping(uint256 => address) areaGovernor; /// @dev alternative: isFarmer[0[InArea OR Gov == CustomRules 
    mapping(uint256 => uint256[]) areaParticipantId; /// @dev areaID, uint256[][uint256(uint160(_who))] = participantID - how stupid is this?
    mapping(address => address) farmChain;

    uint256 public globalId;
    /// ### Modifiers ##################

    

    /// @dev good way to execute arbitrary code. risk scope limit
    modifier CustomAreaRules(uint256 _areaID){
        require( __customRulesBefore(_areaID, msg.sig));
        _;
        require(__customRulesAfter(_areaID, msg.sig));
    }

    /// ### Errors ##################

    /// ### Public ##################

    /// ### External ##################
    function becomeFarmer(uint256 _areaID) external returns (uint256 farmerId) {
        
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
    /// ### View ##################

        function belongsTo(address who, uint256 areaId) external view returns (bool) {
            if (areaParticipantId[areaId][uint256(uint160(who))] != 0) return true; 
        }
}
