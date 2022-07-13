// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";
// import "solmate/auth/Owned.sol";

import "./interfaces/IFarmer.sol";
import "./interfaces/IConsumer.sol";
import "./interfaces/IBasket.sol";


struct A {
    uint256 area_id;
    address governor;
    address rule_contract;
    string data_url;
    uint256[3] FCB; // [ F , C , B ] nr of
}

// is ERC1155("https://potato.bond/api/v1/{id}")
contract Area is ERC1155("https://potato.bond/api/v1/{id}") {

    /// ### Storage ##################
    string constant base_uri = "https://potato.bond/api/v1/";
    uint constant MAX= type(uint256).max -1;
    uint immutable ONE = 1 * (10 ** 18); 

    address initOwner;
    IFarmer F;
    IConsumer C;
    IBasket B;
    
    mapping(uint256 => A) getAreaById; 
    mapping(uint256 => uint256[1157920892373161954235709850086879078532699830619910000]) areaParticipantId; /// @dev areaID, uint256[][uint256(uint160(_who))] = participantID - how stupid is this?
    mapping(address => address) farmChain;
    uint256 public globalId;
    
    /// ### Errors ##################

    /// ### Events ##################

    event fcbComplete(address indexed _this, address _f, address _c, address _b);
    event newFarmerJoinedArea(uint256 indexed _areaID, address indexed _who, uint256 farmerid);
    event newAreaCreated(uint256 indexed _areaID, address indexed _byWho, uint256 farmerid);
    event newFarmerNominatedForArea(uint256 indexed _areaID, address indexed _bywho, address nominated);
    event FailedToJoinOrBecome(uint256 indexed _areaID, address _sender); 
    event plusOne(uint256 _gid);
    event changedGovernorOfAreaTo(uint indexed _areaID, address indexed _to);
    event changedRulesOfArea(uint256 indexed areaID, address indexed _newRulesAddress);

    constructor() { initOwner = msg.sender; }
    
    function setFCB(address _f, address _c, address _b) external {
        require(msg.sender == initOwner);
        F = IFarmer(_f);
        C = IConsumer(_c);
        B = IBasket(_b);
        initOwner = address(1337);

        emit fcbComplete(address(this), _f, _c, _b);
    }

    /// ### Modifiers ##################


    modifier onlyAreaGovernor(uint _areaID) {
        require(getAreaById[_areaID].governor == msg.sender, "Not Area Goveror");
        _;
    }

    /// ### Errors ##################

    /// ### Public ##################

    /// ### External ##################

    function becomeFarmer(uint256 _areaID) external returns (string memory farmerUri) {
        require(! belongsTo(msg.sender, _areaID), "Already in");
        require(_areaID <= globalId, "Invalid Id");

        
        if(_areaID == 0) {
            farmChain[msg.sender] = address(uint160(globalId+2));

            farmerUri = _makeFarmer();

            getAreaById[globalId].area_id = globalId+1;
            getAreaById[globalId].governor = msg.sender;
            getAreaById[globalId].data_url = string.concat(base_uri, string(abi.encodePacked(globalId)));
            
            bytes  memory data = bytes(abi.encode(getAreaById[globalId]));
            _mint(msg.sender, 0, 1, data);
            _mint(msg.sender, globalId + 1, ONE, data);
            areaParticipantId[globalId][uint256(uint160(msg.sender))] = globalId;

            emit newAreaCreated(globalId, msg.sender, globalId);
            return farmerUri;
        }

        else if (belongsTo(farmChain[msg.sender], _areaID)) 
        {
            // areaParticipantId[_areaID][uint256(uint160(msg.sender))] = globalId+1;
            farmerUri = _makeFarmer();
            bytes  memory data = bytes(abi.encode(getAreaById[globalId]));
            areaParticipantId[_areaID][uint256(uint160(msg.sender))] = globalId;

            _mint(msg.sender, _areaID +1, ONE, data);

            emit newFarmerJoinedArea(_areaID, msg.sender, globalId);
            return farmerUri;
        } else {
            emit FailedToJoinOrBecome(_areaID, msg.sender);
            revert("Uninvited");
        }
    }

    function becomeCustomer(uint256 _areaID) external returns (uint256 farmerId)  {
        globalIncrement();
        return 1;
    }

    function inviteFarmer(address _newFarmer, uint256 _area) external  {
        require(farmChain[_newFarmer] == address(0) && belongsTo(msg.sender, _area));

        emit fcbComplete(address(this), address(F), address(C), address(B));
        farmChain[_newFarmer] = msg.sender;
        emit newFarmerNominatedForArea(_area, msg.sender, _newFarmer);
    }

    function changeAreaGovernor(uint _areaID, address _newGov) external  onlyAreaGovernor(_areaID) returns(address) {
        require(_newGov != address(0), "Can't do 0");
        getAreaById[_areaID].governor = _newGov;
        emit changedGovernorOfAreaTo(_areaID, _newGov);
    }

    function changeRulesOfArea(uint _areaID, address _newRulesAddress) external onlyAreaGovernor(_areaID) {
        require(_newRulesAddress.code.length > 0, "Need contract for rules.");
        getAreaById[_areaID].rule_contract = _newRulesAddress;
        emit changedRulesOfArea(_areaID, _newRulesAddress);
    }

    /// ### Override ##################

     function _mint(
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) internal override (ERC1155) {

        if (id == 0) {
            globalIncrement();
            id = globalId;
         }
        super._mint(to,id,amount,data);
    }

    /// ### Private ##################
    function __customRulesBefore(uint256 areaId, bytes4 funcSing) private returns (bool) {
        true;
    }

    function __customRulesAfter(uint256 areaId, bytes4 funcSing) private returns (bool) {
        true;
    }

    function _makeFarmer() private returns (string memory fU) {
        if(F.balanceOf(msg.sender) == 0) {
                fU = string.concat(base_uri, string(abi.encodePacked(globalId)));
                globalIncrement();
                F.mintFarmer(msg.sender, globalId, fU); 
            } else {
                fU = string.concat(base_uri, string(abi.encodePacked(F.getIdOf(msg.sender))));
            }
    }

    function globalIncrement() private returns (uint256) {
        unchecked { ++ globalId; }
        emit plusOne(globalId);
    }



    /// ### View ##################

    function belongsTo(address who, uint256 areaId) public view returns (bool) {
        if (areaParticipantId[areaId][uint256(uint160(who))] != 0) return true; 
    }

    function getFCB() external view returns (address,address,address) {
        return (address(F), address(B), address(C));
    }

    function getArea(uint256 id) public view returns (A memory) {
        return getAreaById[id];
    }
}
