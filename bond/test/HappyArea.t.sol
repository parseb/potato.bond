// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

/// Project
import "src/Area.sol";
import "src/Basket.sol";
import "src/Farmer.sol";
import "src/Consumer.sol";

import "src/interfaces/IBasket.sol";
import "src/interfaces/IFarmer.sol";
import "src/interfaces/IConsumer.sol";

/// Interfaces
import "openzeppelin-contracts/contracts/token/ERC721/IERC721.sol";
import "src/interfaces/IArea.sol";



contract ContractTest is Test {

    address theOwner = address(306);

    address aConsummer = address(101);
    address bConsummer = address(105);
    address cConsummer = address(108);

    address aFarmer = address(69);
    address bFarmer = address(70);
    address cFarmer = address(77);

    string ipfsPlaceholder = "02caed65cb297da311ed1fffb9c48090c7d2c1dbf39c6fc346f7c9962fc5198e";

    Area A;
    uint256 gId;
    Farmer Fa;
    Consumer Co;
    Basket Ba;
    IFarmer F;
    IConsumer C;
    IBasket B;


    function setUp() public {
        vm.prank(theOwner);
        A = new Area();
        Fa = new Farmer(address(A));
        Co = new Consumer(address(A));
        Ba = new Basket(address(A));
        
        vm.prank(theOwner);
        A.setFCB(address(Fa), address(Co), address(Ba));

        (address f, address c, address b) = A.getFCB();
        F= IFarmer(f);
        C= IConsumer(c);
        B= IBasket(b);
        
        gId = A.globalId();

    }

    function aF() internal returns (bool) {
        assertTrue(gId == 0);
        vm.prank(aFarmer);
        A.becomeFarmer(0,ipfsPlaceholder);
        assertTrue(A.globalId() == 2);
        assertTrue(A.belongsTo(aFarmer, 2));
        assertTrue(F.balanceOf(aFarmer) > 0, "Failed to mint" );
        uint aBalance1 = A.balanceOf(aFarmer,3);
        return ( aBalance1 > 1 && A.belongsTo(aFarmer, 2));
    }

    function testBecomesFarmer() public {
        bytes memory placeholder = bytes("placehoder");
        assertTrue(gId == 0);
        vm.prank(aFarmer);
        A.becomeFarmer(0,ipfsPlaceholder);
        assertTrue(A.globalId() == 2);
        assertTrue(A.belongsTo(aFarmer, 2));
        assertTrue(F.balanceOf(aFarmer) > 0, "Failed to mint" );
        uint aBalance1 = A.balanceOf(aFarmer,3);
        assertTrue(aBalance1 > 1, "no balance or 3 is Area" );

        vm.prank(aFarmer);
        A.safeTransferFrom(aFarmer,cFarmer,3,999, placeholder );
        assertTrue(aBalance1 > A.balanceOf(aFarmer,3), "balance check failed");

        vm.prank(bFarmer);
        A.becomeFarmer(0, ipfsPlaceholder);
        assertTrue(A.globalId() == 4);
        assertTrue(A.belongsTo(bFarmer, 4));
        assertTrue(A.balanceOf(bFarmer, 5)> 111, "No area token balance");

        vm.prank(cFarmer);
        vm.expectRevert("Uninvited");
        A.becomeFarmer(1,ipfsPlaceholder);
        vm.prank(cFarmer);
        vm.expectRevert("Invalid Id");
        A.becomeFarmer(9001, ipfsPlaceholder);

        assertTrue(A.belongsTo(aFarmer,2), "aFarmer not belonging");

        vm.prank(aFarmer);
        A.inviteFarmer(cFarmer, 2);
        assertTrue(A.belongsTo(aFarmer,2), "aFarmer not belonging");
        
        vm.prank(cFarmer);
        assertTrue(F.balanceOf(cFarmer) == 0, "Is farmer Already");
        vm.prank(cFarmer);
        A.becomeFarmer(2, ipfsPlaceholder);
        assertTrue(A.belongsTo(cFarmer,2), "cFarmer not belonging");
        assertTrue(A.balanceOf(cFarmer, 3)> 111, "cFarmer does not have Area token balance after joining" );
        
        aBalance1 = A.balanceOf(aFarmer,3);
        assertTrue(aBalance1 > 1, "no balance or 3 is Area" );
        vm.prank(aFarmer);
        A.safeTransferFrom(aFarmer,cFarmer,3,999, placeholder );
        assertTrue(aBalance1 > A.balanceOf(aFarmer,3), "balance check failed");


        vm.prank(cFarmer);
        vm.expectRevert("Already in");
        A.becomeFarmer(2,ipfsPlaceholder);
        
        vm.prank(address(999));
        vm.expectRevert("Uninvited");
        A.becomeFarmer(1, ipfsPlaceholder);
        
        vm.prank(cFarmer);
        A.inviteFarmer(address(999), 2);
        vm.prank(address(999));
        A.becomeFarmer(2, ipfsPlaceholder);

        vm.prank(address(999));
        vm.expectRevert("Already in");
        A.becomeFarmer(2, ipfsPlaceholder);

        /// already farmer, can't be consumer in same area
        vm.prank(aFarmer);
        vm.expectRevert("Already in or farmer");
        A.joinAsConsumer(2, ipfsPlaceholder);
    }



    function testBecomesConsumer() public {
        assertTrue(aF(), "failed to setup area and aFarmer");
        vm.startPrank(aConsummer);
        vm.expectRevert("Area must exist");
        A.joinAsConsumer(52, ipfsPlaceholder);

        A.joinAsConsumer(1, ipfsPlaceholder);
        assertTrue(A.belongsTo(aConsummer, 1),"Should Belong");
        assertTrue(C.balanceOf(aConsummer) == 1,"should have Consummer nft");
        vm.stopPrank();

    }


    function testCreatesBaskets() public {
        //vm.assume(_aToM > 0);
        assertTrue(true);
        assertTrue(aF(), "failed to setup area and aFarmer");
        uint idStart = A.globalId();
        uint amountToMint = 306;

        vm.startPrank(aFarmer);
        vm.expectRevert("Not in Area");
        A.mintBaskets(1312,amountToMint,4334525345, address(324523), ipfsPlaceholder);

        vm.expectRevert("ZeroVal not allowed");
        A.mintBaskets(2,amountToMint,435345, address(0), ipfsPlaceholder);

        A.mintBaskets(2,amountToMint,435345, address(3453450), ipfsPlaceholder);
        assertTrue(A.globalId() == idStart + amountToMint, "id progression invariant");

        vm.stopPrank();
    }


    // function testChangesGovernor() public {
    //     assertTrue(false);
    // }

    // function testChangesRulesContract() public {
    //     assertTrue(false);
    // }

    // function testRolesNotTransferable() public {
    //     assertTrue(false);
    // }

    // function testCreatesArea() public {
    //     assertTrue(false);
    // }

    // function testCreatesBasket() public {
    //     assertTrue(false);
    // }

    // function testBecomesConsumer() public {
    //     assertTrue(false);
    // }

    // function testBuysBasket() public {
    //     assertTrue(false);
    // }

    // function testTransfersBasket() public {
    //     assertTrue(false);
    // }

    // function testRedeemsBasket() public {
    //     assertTrue(false);
    // }






}
