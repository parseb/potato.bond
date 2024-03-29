
const AreaABI= [
  {
    "inputs": [],
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "inputs": [],
    "name": "RuleContractReturnedFalse",
    "type": "error"
  },
  {
    "inputs": [],
    "name": "areaNotTokenTransferable",
    "type": "error"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "account",
        "type": "address"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "operator",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "bool",
        "name": "approved",
        "type": "bool"
      }
    ],
    "name": "ApprovalForAll",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_areaID",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "address",
        "name": "_sender",
        "type": "address"
      }
    ],
    "name": "FailedToJoinOrBecome",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_areaID",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "_farmer",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "howmany",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_gID",
        "type": "uint256"
      }
    ],
    "name": "NewBasketsInArea",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "operator",
        "type": "address"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "to",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint256[]",
        "name": "ids",
        "type": "uint256[]"
      },
      {
        "indexed": false,
        "internalType": "uint256[]",
        "name": "values",
        "type": "uint256[]"
      }
    ],
    "name": "TransferBatch",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "operator",
        "type": "address"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "to",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "id",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "value",
        "type": "uint256"
      }
    ],
    "name": "TransferSingle",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "string",
        "name": "value",
        "type": "string"
      },
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "id",
        "type": "uint256"
      }
    ],
    "name": "URI",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_areaID",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "_to",
        "type": "address"
      }
    ],
    "name": "changedGovernorOfAreaTo",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_areaID",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "_newRulesAddress",
        "type": "address"
      }
    ],
    "name": "changedRulesOfArea",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_areaID",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "consummerID",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "address",
        "name": "sender",
        "type": "address"
      }
    ],
    "name": "consIDaddedToArea",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "_this",
        "type": "address"
      },
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_gID",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "address",
        "name": "_f",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "address",
        "name": "_c",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "address",
        "name": "_b",
        "type": "address"
      }
    ],
    "name": "fcbComplete",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_areaID",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "_byWho",
        "type": "address"
      },
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_gID",
        "type": "uint256"
      }
    ],
    "name": "newAreaCreated",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_areaID",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "_farmer",
        "type": "address"
      },
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_gID",
        "type": "uint256"
      }
    ],
    "name": "newBasket",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_areaID",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "_who",
        "type": "address"
      },
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_gID",
        "type": "uint256"
      }
    ],
    "name": "newFarmerJoinedArea",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_areaID",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "_bywho",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "address",
        "name": "nominated",
        "type": "address"
      }
    ],
    "name": "newFarmerNominatedForArea",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "_gID",
        "type": "uint256"
      }
    ],
    "name": "plusOne",
    "type": "event"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "account",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "id",
        "type": "uint256"
      }
    ],
    "name": "balanceOf",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address[]",
        "name": "accounts",
        "type": "address[]"
      },
      {
        "internalType": "uint256[]",
        "name": "ids",
        "type": "uint256[]"
      }
    ],
    "name": "balanceOfBatch",
    "outputs": [
      {
        "internalType": "uint256[]",
        "name": "",
        "type": "uint256[]"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_basketID",
        "type": "uint256"
      },
      {
        "internalType": "bytes",
        "name": "data",
        "type": "bytes"
      }
    ],
    "name": "basketTransferCallBack",
    "outputs": [
      {
        "internalType": "bool",
        "name": "",
        "type": "bool"
      }
    ],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_areaID",
        "type": "uint256"
      },
      {
        "internalType": "string",
        "name": "ipfsCID",
        "type": "string"
      }
    ],
    "name": "becomeFarmer",
    "outputs": [
      {
        "internalType": "string",
        "name": "farmerUri",
        "type": "string"
      }
    ],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "who",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "areaId",
        "type": "uint256"
      }
    ],
    "name": "belongsTo",
    "outputs": [
      {
        "internalType": "bool",
        "name": "",
        "type": "bool"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_areaID",
        "type": "uint256"
      },
      {
        "internalType": "address",
        "name": "_newRulesAddress",
        "type": "address"
      }
    ],
    "name": "changeRulesOfArea",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_id",
        "type": "uint256"
      }
    ],
    "name": "getAll",
    "outputs": [
      {
        "components": [
          {
            "internalType": "uint256",
            "name": "area_id",
            "type": "uint256"
          },
          {
            "internalType": "uint256[3]",
            "name": "fcb",
            "type": "uint256[3]"
          },
          {
            "internalType": "address",
            "name": "governor",
            "type": "address"
          },
          {
            "internalType": "address",
            "name": "rule_contract",
            "type": "address"
          },
          {
            "internalType": "string",
            "name": "data_url",
            "type": "string"
          },
          {
            "internalType": "string",
            "name": "ipfs",
            "type": "string"
          }
        ],
        "internalType": "struct sA",
        "name": "",
        "type": "tuple"
      },
      {
        "components": [
          {
            "internalType": "uint256",
            "name": "area_id",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "price",
            "type": "uint256"
          },
          {
            "internalType": "address",
            "name": "farmer_address",
            "type": "address"
          },
          {
            "internalType": "address",
            "name": "consumer_address",
            "type": "address"
          },
          {
            "internalType": "address",
            "name": "erc20",
            "type": "address"
          },
          {
            "internalType": "uint256[2]",
            "name": "redeamable",
            "type": "uint256[2]"
          }
        ],
        "internalType": "struct sB",
        "name": "",
        "type": "tuple"
      },
      {
        "components": [
          {
            "internalType": "uint256",
            "name": "area_id",
            "type": "uint256"
          },
          {
            "internalType": "uint256[2]",
            "name": "p_c",
            "type": "uint256[2]"
          },
          {
            "internalType": "string",
            "name": "ipfs",
            "type": "string"
          }
        ],
        "internalType": "struct sC",
        "name": "",
        "type": "tuple"
      },
      {
        "components": [
          {
            "internalType": "uint256",
            "name": "area_id",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "issued",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "fulfilled",
            "type": "uint256"
          },
          {
            "internalType": "address",
            "name": "farmerAddress",
            "type": "address"
          },
          {
            "internalType": "string",
            "name": "ipfs",
            "type": "string"
          }
        ],
        "internalType": "struct sF",
        "name": "",
        "type": "tuple"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "id",
        "type": "uint256"
      }
    ],
    "name": "getArea",
    "outputs": [
      {
        "components": [
          {
            "internalType": "uint256",
            "name": "area_id",
            "type": "uint256"
          },
          {
            "internalType": "uint256[3]",
            "name": "fcb",
            "type": "uint256[3]"
          },
          {
            "internalType": "address",
            "name": "governor",
            "type": "address"
          },
          {
            "internalType": "address",
            "name": "rule_contract",
            "type": "address"
          },
          {
            "internalType": "string",
            "name": "data_url",
            "type": "string"
          },
          {
            "internalType": "string",
            "name": "ipfs",
            "type": "string"
          }
        ],
        "internalType": "struct sA",
        "name": "",
        "type": "tuple"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "id",
        "type": "uint256"
      }
    ],
    "name": "getAreaMetaData",
    "outputs": [
      {
        "internalType": "string",
        "name": "",
        "type": "string"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "getCurrentGId",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "getFCB",
    "outputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      },
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      },
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "globalId",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "_newFarmer",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "_area",
        "type": "uint256"
      }
    ],
    "name": "inviteFarmer",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "account",
        "type": "address"
      },
      {
        "internalType": "address",
        "name": "operator",
        "type": "address"
      }
    ],
    "name": "isApprovedForAll",
    "outputs": [
      {
        "internalType": "bool",
        "name": "",
        "type": "bool"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_areaID",
        "type": "uint256"
      },
      {
        "internalType": "string",
        "name": "_ipfs",
        "type": "string"
      }
    ],
    "name": "joinAsConsumer",
    "outputs": [
      {
        "internalType": "bool",
        "name": "s",
        "type": "bool"
      }
    ],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_areaID",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "amount",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "price",
        "type": "uint256"
      },
      {
        "internalType": "address",
        "name": "erc20",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "rStart",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "rEnd",
        "type": "uint256"
      },
      {
        "internalType": "string",
        "name": "CID",
        "type": "string"
      }
    ],
    "name": "mintBaskets",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "lastId",
        "type": "uint256"
      }
    ],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "internalType": "address",
        "name": "to",
        "type": "address"
      },
      {
        "internalType": "uint256[]",
        "name": "ids",
        "type": "uint256[]"
      },
      {
        "internalType": "uint256[]",
        "name": "amounts",
        "type": "uint256[]"
      },
      {
        "internalType": "bytes",
        "name": "data",
        "type": "bytes"
      }
    ],
    "name": "safeBatchTransferFrom",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "internalType": "address",
        "name": "to",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "id",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "amount",
        "type": "uint256"
      },
      {
        "internalType": "bytes",
        "name": "data",
        "type": "bytes"
      }
    ],
    "name": "safeTransferFrom",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "operator",
        "type": "address"
      },
      {
        "internalType": "bool",
        "name": "approved",
        "type": "bool"
      }
    ],
    "name": "setApprovalForAll",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "_f",
        "type": "address"
      },
      {
        "internalType": "address",
        "name": "_c",
        "type": "address"
      },
      {
        "internalType": "address",
        "name": "_b",
        "type": "address"
      }
    ],
    "name": "setFCB",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "bytes4",
        "name": "interfaceId",
        "type": "bytes4"
      }
    ],
    "name": "supportsInterface",
    "outputs": [
      {
        "internalType": "bool",
        "name": "",
        "type": "bool"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "uri",
    "outputs": [
      {
        "internalType": "string",
        "name": "",
        "type": "string"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  }
];


const metamask = window.ethereum;
let provider;
let signInButton;
let signOutButton;
let userData;

// userData = document.getElementById('user-data');
// mainWrapper = document.getElementById('main-wrapper');
// tcs_gid = document.getElementById('gid');
// invitedFarmer = document.getElementById("inivtedFarmer");
// joinFarmerBtn = document.getElementById("joinFarmerBtn");
// currentFarmerCID = document.getElementById("currentFarmerCIDValueHidden");
// areaIDtoJoin = document.getElementById("areaIDtoJoin");
// areaIDinvited = document.getElementById("areaIDtoInvite");
// areaDescription = document.getElementById("areaDescription");
// rulesForArea = document.getElementById("rulesForArea");
// areaName = document.getElementById("areaName");
// areaBasketID = document.getElementById("areaBasketID");
// howMany = document.getElementById("howMany")
// priceOfBasket = document.getElementById("priceOfBasket");
// rFrom = document.getElementById("rFrom");
// rUntil = document.getElementById("rUntil");  
// ercAddress = document.getElementById("ercAddress");

let AA = {
  'maticmum': '0x5e2c0bc8705addbd360c7ee749ff8d7dc5f13269',
  'matic': ''
}

const AreaContract = async () => {
  const p = new ethers.providers.Web3Provider(window.ethereum);
  let signer = p.getSigner();
  network = await p.getNetwork();
  const areaC = new ethers.Contract(AA[network.name], AreaABI, p);
  return areaC.connect(signer);
}


const joinAreaValidate = async () => {
  // const AreaC = await AreaContract();
  // /// add view method to contract to extenrally check @todo 
  // let isInvited = AreaC.isInvited(areaId, areaAddress);
  console.log("validating address...");
  if (ethers.utils.isAddress(invitedFarmer.value)) {
    invitedFarmer.classList.remove("invalid-yellow");
    invitedFarmer.classList.add("valid-green");
  } else if (invitedFarmer.value == "") {
    invitedFarmer.classList = "form-control";
  } else {
    invitedFarmer.classList.remove("valid-green");
    invitedFarmer.classList.add("invalid-yellow");
  }
}

const joinAsFarmer = async () => {
  areaid = areaIDtoJoin.value;
  currentFarmerCIDifAny = currentFarmerCID.value;
  const Area = await AreaContract();

  ////@todo explicit create farmer logic
  //// current: passing 0 creates farmer,none saved to d
  /// expected: collect and save functional infromation to db and ipfs

  let tx = await Area.becomeFarmer(areaid, currentFarmerCID);
  console.log(tx)
  tx.then( (tx) =>{
    let ZZ = tx.value.toString();
    if (currentFarmerCIDifAny == ZZ) {
      console.log(`existing farmer (you) joined area ${areaid}`);
    } else {
      console.log(`congrats on becoming a farmer!  ipfs://${ZZ}`);
      //// fetch and save to db;
    }
  })
  //let becameFarmer = Area.becomeFarmer(areaid,currentFarmerCID);

}

const inviteFarmer = async () => {
  const Area = await AreaContract();
  let prospectFarmer = invitedFarmer.value;
  let wantedAreaID = areaIDinvited.value;
  console.log("You are inviting ", prospectFarmer, " to Area: ", wantedAreaID);
      // /// @notice use this to invite a farmer to an area to which you
      // function inviteFarmer(address _newFarmer, uint256 _area) external;
  let tx =await Area.inviteFarmer(prospectFarmer, wantedAreaID);
  tx.then(  (t) => {
    console.log("t", t);
    console.log("invite transaction: ", t.value);
    let belongsToArea = Area.belongsTo(prospectFarmer, wantedAreaID);
    belongsToArea.then((b)=> {
      console.log("belongs to area: ", b.value);
    })
  });

}

const createArea = async () => {
  const Area = await AreaContract();
  let description = areaDescription.value;
  let ruleContract = rulesForArea.value;
  let name = areaName.value;

  // fetch(`/areas/?description=${description}&rules=${ruleContract}$name=${name}`)

  await fetch('/areas',
  {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': getCSRF(),
    },
    credentials: 'include',
    body: JSON.stringify({
    description,
    ruleContract,
    name
    })
  }).then((res) => { 
    areaCID = res.text();
    console.log("sending it to peers");
    tx = Area.becomeFarmer(0,areaCID)
    tx.then( (r) => {
      console.log(r.value, " - should equal - ", areaCID);
    })

});

}

function ruleAreaValidate() {
  console.log("validating address...");
  if (ethers.utils.isAddress(rulesForArea.value)) {
    rulesForArea.classList.remove("invalid-yellow");
    rulesForArea.classList.add("valid-green");
    ///@todo validate if it observes IRules 
  } else if (rulesForArea.value == "") {
    rulesForArea.classList = "form-control";
  } else {
    rulesForArea.classList.remove("valid-green");
    rulesForArea.classList.add("invalid-yellow");
  }
}

function erc20priceValidate() {
  console.log("validating ERC20...");
  if (ethers.utils.isAddress(ercAddress.value)) {
    ercAddress.classList.remove("invalid-yellow");
    ercAddress.classList.add("valid-green");
    ///@todo poke to validate as ERC20
  } else if (ercAddress.value == "") {
    ercAddress.classList = "form-control";
  } else {
    ercAddress.classList.remove("valid-green");
    ercAddress.classList.add("invalid-yellow");
  }

}

const createBaskets = async () => {
   /// @notice function for farmers to mint basket of goods as an ERC721
    ///         a basket is a non fungible token that stands in as a promise to produce the goods it represents to its bearer
    ///         within the advertised terms outlined in the metadata 
    ///         such as specific products and quantities, claimable between the data of & date of
    /// @param _areaID area consumer wants to join
    /// @param amount nr of duplicate baskets to print (how many of this)
    /// @param price - how much for basket?
    /// @param erc20 - address of denoming ERC20 for these baskets
    /// @param _start when this basket can be redeemed for the underlying. unix epoch block.timstamp check
    /// @param _end when this basket will stop being redemable (think supermarket expired - underlying claim ineligible)
    /// @param CID ipfs metadata storage 
    // function mintBaskets(uint _areaID, uint amount, uint price, address erc20,  uint _start, uint _end, string memory CID) external returns(uint);
    console.log("creating baskets...")

  const Area = await AreaContract();
  areaBasketID = areaBasketID.value;
  howMany = howMany.value;
  priceOfBasket = priceOfBasket.value;
  rFrom = rFrom.value;
  rUntil = rUntil.value;
  ercAddress = ercAddress.value;
  // fetch(`/areas/?description=${description}&rules=${ruleContract}$name=${name}`)

  await fetch('/baskets',
  {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': getCSRF(),
    },
    credentials: 'include',
    body: JSON.stringify({
      area_id: areaBasketID,
      amount: howMany,
      price: priceOfBasket,
      erc_address: ercAddress,
    })
  }).then(async (res) => { 
    areaCID = await res.text();
    console.log("sending it to peers... CID:",areaCID );
    console.log(`minting ${howMany} baskets with arguments in order; ${areaBasketID, howMany, priceOfBasket, ercAddress, rFrom, rUntil, areaCID } ` )
    // (uint _areaID, uint amount, uint price, address erc20,  uint _start, uint _end, string memory CID) external returns(uint);

    tx = Area.mintBaskets(areaBasketID, howMany, priceOfBasket, ercAddress, rFrom, rUntil, ('ipfs://'+ areaCID) );
    tx.then( (r) => {
      console.log(r.text(), " - should equal - ", );
    })

  });

}
//// --- .. /// \\\\ ----~!!! Not needed since all fetch from Area
// const FarmerContract = async () => {
//   const p = new ethers.providers.Web3Provider(window.ethereum);
//   let signer = p.getSigner();
//   network = await p.getNetwork();
//   const areaC = new ethers.Contract(AA[network.name], AreaABI, p);
//   return areaC.connect(signer);
// }

// const ConsumerContract = async () => {
//   const p = new ethers.providers.Web3Provider(window.ethereum);
//   let signer = p.getSigner();
//   network = await p.getNetwork();
//   const areaC = new ethers.Contract(AA[network.name], AreaABI, p);
//   return areaC.connect(signer);
// }

// const BasketContract = async () => {
//   const p = new ethers.providers.Web3Provider(window.ethereum);
//   let signer = p.getSigner();
//   network = await p.getNetwork();
//   const areaC = new ethers.Contract(AA[network.name], AreaABI, p);
//   return areaC.connect(signer);
// }

async function getLastId() {
  const Area = await AreaContract();
  let tx = await Area.getCurrentGId();
  console.log("LastId tx - ", tx.toString());
  return tx;
}

const signIn = async (connector) => {
  /**
     * Connects to the wallet and starts a etherjs provider.
  */
  if (connector === 'metamask') {
    await metamask.request({
      method: 'eth_requestAccounts',
    });
    provider = new ethers.providers.Web3Provider(metamask);
  }

  const [address] = await provider.listAccounts();
  if (!address) {
    throw new Error('Address not found.');
  }


  /**
     * Try to resolve address ENS and updates the title accordingly.
  */
  let ens;
  try {
    ens = await provider.lookupAddress(address);
  } catch (error) {
    console.error("No ENS/Not supported");
  }

  let { chainId } = await provider.getNetwork();

  /**
     * Gets the proper message from our backend
  */
  const message = await fetch('/message',
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': getCSRF(),
      },
      credentials: 'include',
      body: JSON.stringify({
        chainId,
        address,
      })
    }).then((res) => res.text());

  /**
     * Asks for the provider to sign our fresh message
  */
  const signature = await provider.getSigner().signMessage(message);

  /**
     * Calls our sign_in endpoint to validate the message, if successful it will
     * save the message in the session and allow the user to store his text
  */
  fetch(`/sign-in`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': getCSRF(),
    },
    credentials: 'include',
    body: JSON.stringify({ signature, ens }),
  }).then(async (res) => {
    if (res.status === 200) {
      res.json().then(({ lastSeen, address, ens }) => {
        console.log(lastSeen, ens, address);
        connectedState(lastSeen, address, ens);
        return;
      });
    } else {
      res.json().then((err) => {
        console.error(err);
      });
    }
  });



};

const signOut = async () => {
  return fetch('/sign-out', {
    method: 'POST',
    credentials: 'include', headers: {
      'X-CSRF-Token': getCSRF(),
    }
  }).then(() => disconnectedState());
};

const connectedState = async (lastSeen, address, ens) => {
  /**
   * Updates fields and buttons
   */

  
  signInButton.classList.add('hidden');

  signOutButton.addEventListener('click', signOut);
  signOutButton.classList.remove('hidden');

  const dt = luxon.DateTime.fromISO(lastSeen);
  const timestamp = dt.toLocaleString(luxon.DateTime.DATETIME_MED);

  console.log(ens, address);
  const user = ens || address;  

  userData.innerText = `${user}`;

  // userData.innerText = `signed in as\n${user}\n\nlast seen at ${timestamp}`;
  userData.classList.remove('hidden');

  //-------------

  mainWrapper.classList.remove('d-none');

  const AAA = await AreaContract();
  const lastId = await getLastId();
  // let chainId = await provider.getNetwork();

  async function postCreateResource(resourceNamePlural, item) {
  
    selector = ['areas', 'baskets', 'consumers', 'farmers']
      console.log("getting - ", resourceNamePlural, " - ", item);
      const Area = await AreaContract();
      const tx = await Area.getAll(item);
      let data = '';
      setTimeout(() => { 
      switch (resourceNamePlural) {
        case 'areas':
          r = tx[0]
          console.log("r  ", r );
          for (const [key, value] of Object.entries(r)) {
            console.log(`${key} - ${value}`);
            data += `${key}=${value}&`
          }
          console.log("--area--")
  
          break;
        case 'baskets':
          r = tx[1]
          for (const [key, value] of Object.entries(r)) {
            console.log(`${key}: ${value}`);
            data += `${key}=${value}&`
          }
          data+=`nft_id=${item}`
          console.log("--basket--")
  
          break;
        case 'consumers':
          r = tx[2]
          for (const [key, value] of Object.entries(r)) {
            console.log(`${key}: ${value}`);
            data += `${key}=${value}&`
          }
          data+=`nft_id=${item}`
          console.log("--consumer--")
  
          break;
        case 'farmers':
          r = tx[3]
          for (const [key, value] of Object.entries(r)) {
            console.log(`${key}: ${value}`);
            data += `${key}=${value}&`;
          }
          data+=`nft_id=${item}`
          console.log("--farmer--")
          break;
      }
     
  
      fetch(`/${resourceNamePlural}/?${data}`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': getCSRF(),
        },}).then( async (res) => {
          if( res.status === 200) { console.log(`${resourceNamePlural} with id ${item} created`)}
        })

    }, parseInt(item)* 500 );
  }

  fetch(`/current-known-gid/?gid="${parseInt(lastId)}"`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': getCSRF(),
    },}).then(async (res) => {
      if (res.status === 200 ) {
        console.log("this is res--- " );
        res.json().then( (res) => {
          if(res[0]) {
            XXXX = res[0];
            console.log( XXXX );
            XXXX.areas.forEach( function (item){
              setTimeout(() => { 
                postCreateResource('areas', item); 
            }, parseInt(item) * 500);      
            });
            XXXX.farmers.forEach( function (item){
              setTimeout(() => { 
               postCreateResource('farmers', item);
            },parseInt(item) * 500);
            });
            XXXX.baskets.forEach( function (item){
              setTimeout(() => { 
  
               postCreateResource('baskets', item);
            },parseInt(item) * 500);
            });
            XXXX.consumers.forEach(function (item){
              setTimeout(() => { 
  
               postCreateResource('consumers', item);
            },parseInt(item) * 500);
            });
          }
        });
      } else {
        res.json().then((err) => {
          console.error(err);
        });
      }
    });



 
};

const disconnectedState = () => {
  signInButton.classList.remove('hidden');
  signOutButton.classList.add('hidden');
  userData.classList.add('hidden');
  /// -----------
  mainWrapper.classList.add('d-none');

};

const getCSRF = () => {
  return document.querySelector('meta[name="csrf-token"]').content;
};

document.addEventListener('DOMContentLoaded', () => {
  /**
   * Try to fetch user information and updates the state accordingly
   */
  fetch('/profile', {
    credentials: 'include', headers: {
      'X-CSRF-Token': getCSRF(),
    }
  }).then((res) => {
    if (res.status === 200) {
      res.json().then(({ lastSeen, address, ens }) => {
        connectedState(lastSeen, address, ens);
      });
    } else {
      /**
       * No session we need to enable signIn buttons
       */
      disconnectedState();
    }
  });

  /**
   * Bellow here are just helper functions to manage app state
   */
  signInButton = document.getElementById('sign-in-button');
  signInButton.addEventListener('click', () => signIn("metamask"));
  signOutButton = document.getElementById('sign-out');
  signOutButton.addEventListener('click', signOut);
  userData = document.getElementById('user-data');
  mainWrapper = document.getElementById('main-wrapper');
  tcs_gid = document.getElementById('gid');
  invitedFarmer = document.getElementById("inivtedFarmer");
  joinFarmerBtn = document.getElementById("joinFarmerBtn");
  currentFarmerCID = document.getElementById("currentFarmerCIDValueHidden");
  areaIDtoJoin = document.getElementById("areaIDtoJoin");
  areaIDinvited = document.getElementById("areaIDtoInvite");
  areaDescription = document.getElementById("areaDescription");
  rulesForArea = document.getElementById("rulesForArea");
  areaName = document.getElementById("areaName");
  areaBasketID = document.getElementById("areaBasketID");
  howMany = document.getElementById("howMany")
  priceOfBasket = document.getElementById("priceOfBasket");
  rFrom = document.getElementById("rFrom");
  rUntil = document.getElementById("rUntil");  
  ercAddress = document.getElementById("ercAddress");

});
