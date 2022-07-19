struct sA {
    uint256 area_id;
    uint256[3] fcb; // [ Farmers , Consummers , Baskets ] nr of
    address governor;
    address rule_contract;
    string data_url;
    string ipfs;
}

struct sF {
    uint256 area_id;
    uint256 issued;
    uint256 fulfilled;
    address farmerAddress;
    //address referred_by; farmchain[farmerAddress] = refferedBy; if 0 Area root
    string ipfs;
}

struct sC {
    uint256 area_id;
    uint256[2] p_c;
    string ipfs; 
}

struct sB {
    uint256 area_id;
    uint256 price;
    address farmer_address;
    address consumer_address;
    address erc20;
    uint256[2] redeamable; // @dev do smth
    //state; // farmer minted and owned 1/0, bought and unclaimed 1/1, bouth and claimed 0/1 & burn
}
