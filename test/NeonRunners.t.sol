// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/NeonRunners.sol";

contract NeonRunnersTest is Test {
    NeonRunners public neonRunners;

    function setUp() public {
        neonRunners = new NeonRunners();
    }
}
