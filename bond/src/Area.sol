// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";
// import "solmate/auth/Owned.sol";

import "./Farmer.sol";
import "./Consumer.sol";
import "./Basket.sol";


// is ERC1155("https://potato.bond/api/v1/{id}")
contract Area {
    

    /// ### Storage ##################
    string constant base_uri = "https://potato.bond/api/v1/";

    Farmer F;
    Consumer C;
    Basket B;

    mapping(uint256 => address) areaIdCustomRulesContract;
    mapping(uint256 => address) areaGovernor; /// @dev alternative: isFarmer[0[InArea OR Gov == CustomRules 
    mapping(uint256 => uint256[]) areaParticipantId; /// @dev areaID, uint256[][uint256(uint160(_who))] = participantID - how stupid is this?
    mapping(address => address) farmChain;

    uint256 public globalId;

    /// ### Errors ##################

    /// ### Events ##################

    event fcbComplete(address indexed _this, address _f, address _c, address _b);
    event newFarmerJoinedArea(uint256 indexed _areaID, address indexed _who, uint256 farmerid);
    event newAreaCreated(uint256 indexed _areaId, address indexed _byWho, uint256 farmerid);
    event newFarmerNominatedForArea(uint256 indexed _areaId, address indexed _bywho, address nominated);

    constructor() {
        /// @dev reconsider I ! store cc
        F= new Farmer(address(this));
        C= new Consumer(address(this));
        B= new Basket(address(this));

        emit fcbComplete(address(this), address(F), address(C), address(B));
    }


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
    function becomeFarmer(uint256 _areaID) external returns (string memory farmerUri) {
        require(! belongsTo(msg.sender, _areaID), "Already in");

        globalIncrement();

        farmerUri = string.concat(base_uri, string(abi.encodePacked(globalId)));

        if (belongsTo(farmChain[msg.sender], _areaID)) {
             areaParticipantId[_areaID][uint256(uint160(msg.sender))] = globalId;
             /// Call Farmer to mint to msg.sender
            require( _mintFarmer(msg.sender, globalId, farmerUri));
            
            emit newFarmerJoinedArea(_areaID, msg.sender, globalId);
        }

        if(_areaID == 0) {
             areaParticipantId[globalId][uint256(uint160(msg.sender))] = globalId;
             farmChain[msg.sender] = address(uint160(globalId));

             require( _mintFarmer(msg.sender, globalId, farmerUri));
             
             emit newAreaCreated(globalId, msg.sender, globalId);
        }
    }

    function becomeCustomer(uint256 _areaID) external returns (uint256 farmerId)  {
        globalIncrement();
        return 1;
    }

    function nominateFarmer(address _newFarmer, uint256 _area) external returns (bool) {
        require(farmChain[_newFarmer] == address(0) && belongsTo(msg.sender, _area));
        /// allows multiple nominations
        farmChain[_newFarmer] == msg.sender;
        emit newFarmerNominatedForArea(_area, msg.sender, _newFarmer);
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

    function _mintFarmer(address _becomesFarmer, uint256 _id, string memory _uri) private returns (bool) {
        return F.mintFarmer(_becomesFarmer, _id, _uri);
    }

    /// ### View ##################

        function belongsTo(address who, uint256 areaId) public view returns (bool) {
            if (areaParticipantId[areaId][uint256(uint160(who))] != 0) return true; 
        }

        function getFCB() external view returns (address,address,address) {
            return (address(F), address(B), address(C));
        }
}
