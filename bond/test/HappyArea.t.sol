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



    function testBecomesFarmer() public {
        assertTrue(gId == 0);
        vm.prank(aFarmer);
        A.becomeFarmer(0);
        assertTrue(A.globalId() == 1);
        vm.prank(bFarmer);
        A.becomeFarmer(0);
        assertTrue(A.globalId() == 2);

        vm.prank(cFarmer);
        vm.expectRevert("Uninvited");
        A.becomeFarmer(1);
        vm.prank(cFarmer);
        vm.expectRevert("Invalid Id");
        A.becomeFarmer(9001);

        assertTrue(A.belongsTo(aFarmer,1), "Farmer not belonging");


        vm.prank(aFarmer);
        A.nominateFarmer(cFarmer, 1);

        assertTrue(A.belongsTo(aFarmer,1), "Farmer not belonging");
        
        vm.prank(cFarmer);
        assertTrue(F.balanceOf(cFarmer) == 0, "Is farmer Already");
        vm.prank(cFarmer);
        A.becomeFarmer(1);
        vm.prank(cFarmer);
        vm.expectRevert("Already in");
        A.becomeFarmer(1);
        
        vm.prank(address(999));
        vm.expectRevert("Uninvited");
        A.becomeFarmer(1);
        
        vm.prank(cFarmer);
        A.nominateFarmer(address(999), 1);
        vm.prank(address(999));
        A.becomeFarmer(1);

        vm.prank(address(999));
        vm.expectRevert("Already in");
        A.becomeFarmer(1);


    }

    function testRolesNotTransferable() public {
        assertTrue(false);
    }

    function testCreatesArea() public {
        assertTrue(false);
    }

    function testCreatesBasket() public {
        assertTrue(false);
    }

    function testBecomesConsumer() public {
        assertTrue(false);
    }

    function testBuysBasket() public {
        assertTrue(false);
    }

    function testTransfersBasket() public {
        assertTrue(false);
    }

    function testRedeemsBasket() public {
        assertTrue(false);
    }






}
