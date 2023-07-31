// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {ChangeVariableOrder_V1} from "../src/ChangeVariableOrder_V1.sol";

contract ChangeVariableOrder_V1_Test is Test {
    ChangeVariableOrder_V1 public counter;

    function setUp() public {
        counter = new ChangeVariableOrder_V1();
        counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
