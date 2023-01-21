// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/NeonRunners.sol";

contract NeonRunnersTest is Test {
    NeonRunners public neonRunners;

    function setUp() public {
        neonRunners = new NeonRunners();
    }

    function testFailRunRunRunMaxQuantityExceeded() public {
        neonRunners.runRunRun(6);
    }

    function testFailRunRunRunNoPay() public {
        neonRunners.runRunRun(1);
    }

    function testRunRunRunMintSuccessful() public {
        neonRunners.runRunRun{value: 0.005 ether}(1);
    }

    function testRunRunRunMint3Successful() public {
        neonRunners.runRunRun{value: 0.015 ether}(3);
    }

    function testInstallChooms() public {
        string memory newBaseURI = "ipfs://Qmabc123";
        neonRunners.installChooms(newBaseURI);
        assertEq(neonRunners.baseURI(), newBaseURI);
    }
}
