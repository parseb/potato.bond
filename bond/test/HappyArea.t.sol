// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

/// Project
import "src/Area.sol";
import "src/Basket.sol";
import "src/Farmer.sol";
import "src/Consumer.sol";

/// Interfaces
import "openzeppelin-contracts/contracts/token/ERC721/IERC721.sol";
import "src/interfaces/IArea.sol";



contract ContractTest is Test {

    address theOwner = address(306);
    address aConsummer = address(101);
    address aFarmer = address(69);
    Area A;
    Farmer F;
    Consumer C;
    Basket B;

    function setUp() public {
        vm.prank(theOwner);
        A = new Area();
        // F = new Farmer(address(A));
        // C = new Consumer(address(A));
        // B = new Basket(address(A));
        
    }


    function testBecomesFarmer() public {

        /// letThereBeAFarmer
        //A.becomeFarmer();
        //assertTrue(false);
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
